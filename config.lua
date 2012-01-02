application
{
    content =
    {
        -- iPhone4 resolutions; iPhone 2/3 used 320x480
        -- Possible design option to scale dimensions dynamically
        width = 960,
        height = 640,
        scale = "letterbox",
        
        -- Don't center dynamically scaled content if diff devices
        xALign = "left", 
        yAlign = "top",
        
        -- Software anti-aliasing for vector graphics; Performance hit 
        antialias = true,
        
        -- Default frame rate is 30; Need for Twitch style gameplay
        fps = 60,
        
        -- Predefined image resolutions for scaling w/o knowledge
        imageSuffix = 
        {
            ["@2"] = 2,
        },
    },
}
-- see http://bit.ly/r1xU9C
