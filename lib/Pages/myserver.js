const socketio = require('socket.io');
const express = require('express');
const http = require('http');
const app = express();

server = app.listen(3000);
//io server
 //const io = require("socket.io")(server);
//3000 or any other port.
const io = http.createServer(app);
const PORT = 3000 || process.env.PORT;

console.log(`Server running on port ${PORT}`);

var userConnection = [];

io.on('connect', (socket)=> 
{
console.log(`nside connection`);
socket.on('users_info_to_signaling_server', (data) =>
{        
var other_users = userConnection.filter(p=> p.meeting_id == data.meetingid);    
// data saves to userConnection variable
// connection id and socket id are same
userConnection.push({
    connectionId: socket.id,
    user_id: data.current_user_name,
    meeting_id: data.meetingid,
})

})
    
})