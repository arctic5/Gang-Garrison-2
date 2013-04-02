var text, name;

write_ushort(global.replayBuffer, 1)// Length of the coming message
write_ubyte(global.replayBuffer, REPLAY_END)

name = get_save_filename(".rp",working_directory+"\Replays\Replay.rp")

if name != filename_name("*.rp"){
    name = "*.rp"
}

if name != ""
{
    text = file_bin_open(name, 1)
    while buffer_bytes_left(global.replayBuffer) > 0
    {
        file_bin_write_byte(text, read_ubyte(global.replayBuffer));
    }
    file_bin_close(text);
    
    buffer_clear(global.replayBuffer)
    global.recordingEnabled = 0
}
