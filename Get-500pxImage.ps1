$response = invoke-restmethod -uri 'https://api.500px.com/v1/photos?feature=fresh_today&consumer_key=rZQZZBZ2iz4UpghOYYDZy0LAWfPXzxYpP18hTxv0&image_size=2048'

foreach($image in $response.photos) { Invoke-WebRequest $image.image_url -OutFile "$($image.name).jpg" }

Function Set-WallPaper($Value)
{
Set-ItemProperty -path 'HKCU:\Control Panel\Desktop\' -name wallpaper -value $value
rundll32.exe user32.dll, UpdatePerUserSystemParameters
}

Function Get-WallPaper
{
                (Get-ItemProperty -path 'HKCU:\Control Panel\Desktop\' -name wallpaper).Wallpaper
}
