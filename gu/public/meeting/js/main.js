'use strict'
//device
var audioSource = document.querySelector('select#audioSource');
var audioOutput = document.querySelector('select#audioOutput');
var videoSource = document.querySelector('select#videoSource');
//picture
var snapshot = document.querySelector('button#snapshot');
var picture = document.querySelector('canvas#picture');
picture.width = 320;
picture.height = 240;
//record
var recvideo = document.querySelector('video#recplayer');
var btnRecord = document.querySelector('button#record');
var btnPlay = document.querySelector('button#recplay');
var btnDownload = document.querySelector('button#download');
var buffer;
var mediaRecorder;

var offer = document.querySelector('textarea#offer');
var answer = document.querySelector('textarea#answer');

var shareDeskBox  = document.querySelector('input#shareDesk');

//video
var localVideo = document.querySelector('video#localvideo');
var remoteVideo = document.querySelector('video#remotevideo');
var btnConn = document.querySelector('button#connserver');
var btnLeave = document.querySelector('button#leave');
var inputroom = document.querySelector('input#room');

var localStream = null;
var remoteStream = null;
var socket = null;
var roomid;
var m = new Map();
var state = 'init';
var users = null;
var pcConfig = {
    'iceServers': [{
        'urls': [
            'turn:eutopia.icu:3478',
            'stun:eutopia.icu:3478'
        ],
        'credential':'51115111QWER',
        'username': 'turnserver'
    }]
};
var pc =null;
var peer = null;

//如果返回的是false说明当前操作系统是手机端，如果返回的是true则说明当前的操作系统是电脑端
function IsPC() {
    var userAgentInfo = navigator.userAgent;
    var Agents = ["Android", "iPhone","SymbianOS", "Windows Phone","iPad", "iPod"];
    var flag = true;

    for (var v = 0; v < Agents.length; v++) {
        if (userAgentInfo.indexOf(Agents[v]) > 0) {
            flag = false;
            break;
        }
    }

    return flag;
}
//如果返回true 则说明是Android  false是ios
function is_android() {
    var u = navigator.userAgent, app = navigator.appVersion;
    var isAndroid = u.indexOf('Android') > -1 || u.indexOf('Linux') > -1; //g
    var isIOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/); //ios终端
    if (isAndroid) {
        //这个是安卓操作系统
        return true;
    }

    if (isIOS) {
        //这个是ios操作系统
        return false;
    }
}
//获取url参数
function getQueryVariable(variable)
{
    var query = window.location.search.substring(1);
    var vars = query.split("&");
    for (var i=0;i<vars.length;i++) {
        var pair = vars[i].split("=");
        if(pair[0] == variable){return pair[1];}
    }
    return(false);
}


//设备管理
function getDevices(deviceInfos) {
    deviceInfos.forEach(function (deviceInfo) {
        var option = document.createElement('option');
        option.text = deviceInfo.label;
        option.value = deviceInfo.deviceId;
        if (deviceInfo.kind === 'audioinput'){
            audioSource.appendChild(option);
        }
        else if (deviceInfo.kind === 'audiooutput'){
            audioOutput.appendChild(option);
        }
        else if (deviceInfo.kind === 'videoinput'){
            videoSource.appendChild(option);
        }
    })
}
videoSource.onchange = start;
//截图
snapshot.onclick = function () {
    picture.getContext('2d').drawImage(localVideo,0,0,picture.width,picture.height);
}
function handleDataAvailable(e){
    if(e && e.data && e.data.size >0){
        buffer.push(e.data);
    }
}
//录制
function startRecord(){
    buffer = [];
    var options = {
        mimeType:'video/webm;codecs=vp8'
    }
    if(!MediaRecorder.isTypeSupported(options.mimeType)){
        console.error(`${options.mimeType} is not supported!`);
        return;
    }
    try{
        mediaRecorder = new MediaRecorder(window.stream, options);
    }catch (e) {
        console.error('Failed to create MediaRecorder:', e);
        return;
    }
    mediaRecorder.ondataavailable = handleDataAvailable;//数据有效时的处理函数
    mediaRecorder.start(10);

}
function stopRecord(){
    mediaRecorder.stop();
}

btnRecord.onclick =  () =>{
    if(btnRecord.textContent === 'Start Record'){
        startRecord();
        btnRecord.textContent = 'Stop Record';
        btnPlay.disabled = true;
        btnDownload.disabled = true;
    }else {
        stopRecord();
        btnRecord.textContent = 'Start Record';
        btnPlay.disabled = false;
        btnDownload.disabled = false;
    }
}
btnPlay.onclick = () =>{
    var blob = new Blob(buffer, {type:'video/webm'});
    recvideo.src = window.URL.createObjectURL(blob);
    recvideo.srcObject = null;
    recvideo.controls = true;
    recvideo.play();
}

btnDownload.onclick = () =>{
    var blob = new Blob(buffer,{type:'video/webm'});
    var url = window.URL.createObjectURL(blob);
    var a = document.createElement('a');
    a.href = url;
    a.style.display = 'none';
    a.download= 'video.webm';
    a.click();
}

//按键开始
function connSignalServer() {
    start();
    return true;
}
//初始化本地音频数据
function start() {
    if (!navigator.mediaDevices ||
        !navigator.mediaDevices.getUserMedia) {
        console.log('getUserMedia is not supported');
        return;
    } else {
        var deviceId = videoSource.value;
        var constraints = {
            video: {
                width:400,
                height:240,
                frameRate:30,
                //environment:后置摄像头，user：前置摄像头
                facingMode:"user",
                deviceId: {exact:deviceId ? deviceId:undefined}
            },
            audio: {
                //降噪
                noiseSuppression:true,
                //回音消除
                echoCancellation:true,
                autoGainControl: true
            },
        }
        navigator.mediaDevices.getUserMedia(constraints)
            .then(getMediaStream)
            .then(getDevices)
            .catch(handleError);
    }
}
//获取本地视频流
function getMediaStream(stream) {
    if(localStream){
        stream.getAudioTracks().forEach((track)=>{
            localStream.addTrack(track);
            stream.removeTrack(track);
        });
    }else{
        localStream = stream;
    }
    localVideo.srcObject = localStream;
    window.stream = stream;
    conn();
    return navigator.mediaDevices.enumerateDevices();//返回promise
}

function getDeskStream(stream){
    localStream = stream;
}
function handleError(err){
    console.error('Failed to get Media Stream!', err);
}

function shareDesk(){

    if(IsPC()){
        navigator.mediaDevices.getDisplayMedia({video: true})
            .then(getDeskStream)
            .catch(handleError);
        return true;
    }
    return false;
}

//函数注册
function conn() {
    socket = io.connect();
    roomid = inputroom.value;
    socket.on('joined', (roomid, id, users) =>{
        console.log('receive joined message:', roomid ,' ', id);
        if(users>1){
            createPeerConnection(id);
        }
        state = 'joined';
        btnConn.disabled = true;
        btnLeave.disabled = false;
        console.log('receive joined message:state=', state);

    });
    socket.on('otherjoin', (roomid, id) =>{
        console.log('receive otherjoin message:', roomid ,' ', id);
        createPeerConnection(id);
        if(state === 'join_unbind'){
            createPeerConnection(id);
        }
        state = 'joined_conn';
        //媒体协商
        //
        call();
        console.log('receive otherjoin message:state=', state);
    });
    socket.on('full', (roomid, id) =>{
        console.log('receive full message:', roomid , id);
        hangup();
        closeLocalMedia();
        state = 'leaved';
        console.log('receive full message:state=', state);
        alert('the room is full!');
    });
    socket.on('leaved', (roomid, id) =>{
        console.log('receive leaved message:', roomid ,' ', id);
        state = 'leaved'
        console.log('receive leaved message:state=', state);
        socket.disconnect();
        btnConn.disabled = false;
        btnLeave.disabled = true;
    });
    socket.on('bye', (roomid, id) =>{
        console.log('receive bye message:', roomid , id);
        state = 'join_unbind';
        hangup();
        offer.value = '';
        answer.value = '';
        console.log('receive bye message:state=', state);
    });
    socket.on('disconnect', (socket) => {
        console.log('receive disconnect message!', roomid);
        if(!(state === 'leaved')){
            hangup();
            closeLocalMedia();
        }
        state = 'leaved';
    });
    socket.on('message', (roomid, data) =>{
        console.log('receive client message:', roomid ,' ', data.type);
        //媒体协商
        if (data){
            if(data.type === 'offer'){
                pc.setRemoteDescription(new RTCSessionDescription(data));//SetRemoteDescription方法保存SDP
                pc.createAnswer()
                    .then(getAnswer)
                    .catch(handleAnswerError);
            }else if(data.type === 'answer'){
                pc.setRemoteDescription(new RTCSessionDescription(data));
            }else if(data.type === 'candidate'){
                var candidate = new RTCIceCandidate({
                    sdpMLineIndex: data.label,
                    candidate:data.candidate
                });
                pc.addIceCandidate(candidate);
            }else{
                console.error('the message is invalid!', err);
            }
        }
    });
    socket.emit('join',roomid);
    return;
}

function createPeerConnection(id) {
    console.log('create RTCPeerConnection!');
    pc = new RTCPeerConnection(pcConfig);//创建连接
    pc.onicecandidate = (e) => {
        if(e.candidate){
            console.log('find an new candidate', e.candidate);
            sendMessage(roomid, {
                type:'candidate',
                label:e.candidate.sdpMLineIndex,
                id: e.candidate.sdpMid,
                candidate: e.candidate.candidate
            });
        }else{
            console.log('this is the end candidate');
        }
    }
    pc.onaddstream = getRemoteStream;
    console.log('bind tracks into RTCPeerConnection!');
    if( pc === null || pc === undefined) {
        console.error('pc is null or undefined!');
        return;
    }
    if(localStream === null || localStream === undefined) {
        console.error('localstream is null or undefined!');
        return;
    }
    //add all track into peer connection
    localStream.getTracks().forEach((track)=>{
        pc.addTrack(track, localStream);
    });
}
function getRemoteStream(e){
    remoteStream = e.stream;
    remoteVideo.srcObject = e.stream;
}


function sendMessage(roomid, data) {
    console.log('send p2p message', roomid, data);
    if(socket){
        socket.emit('message', roomid, data);
    }
}

function handleOfferError(err) {
    console.error('Failed to get Offer!', err);
}

function getAnswer(desc) {
    pc.setLocalDescription(desc);
    sendMessage(roomid, desc);

}
function handleAnswerError(err) {
    console.error('Failed to get Answer!', err);
}


function getOffer(desc) {
    pc.setLocalDescription(desc);
    sendMessage(roomid, desc);
}

function call() {
    if(state === 'joined_conn'){
        if(pc){
            var options = {
                offerToReceiveAudio:1,
                offerToReceiveVideo:1
            };
            pc.createOffer(options)
                .then(getOffer)
                .catch(handleOfferError);
        }
    }
}

function hangup(){

    if(pc) {
        pc.close();
        pc = null;
    }

}



function handleError(err) {
    if(err){
        console.error('Failed to get Media Stream', err);
    }
    else{
        console.error('Failed to get Media Stream', );
    }
    return;
}

function closeLocalMedia(){
    if(localStream && localStream.getTracks()){
        localStream.getTracks().forEach((track)=>{
            track.stop();
        });
    }
    localStream = null;
}

function leave(){
    if(socket){
        socket.emit('leave', roomid);
    }
    //释放资源
    hangup();
    closeLocalMedia();
    btnConn.disabled = false;
    btnLeave.disabled = true;
}

btnConn.onclick = connSignalServer;
btnLeave.onclick = leave;
