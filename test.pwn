
global:playAudioFromYoutubeUID() 
{
    new url[128];
    format(url, 128, "localhost/yt/get.php?id=%s", uid);
    HTTP(playerid, HTTP_GET, url, "", "OnAudioConversionComplete");
    return 1;
}


 
public OnAudioConversionComplete(index, response_code, data[])
{
    new buffer[ 128 ];
    if(response_code == 200) //Did the request succeed?
    {
        format(buffer, 128, "localhost/yt/files/%s.mp3", uid);
        loop(playerid = 0, EXMPLAYERS) {
            PlayAudioStreamForPlayer(playerid, buffer, 0, 0, 0, 0, 0);
        }
    }
}
