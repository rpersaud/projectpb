application
{
    content =
    {
        [[-- iPhone4 resolutions; iPhone2/3 used 320x480 --]]
        width = 960,
        height = 640,
        scale = "letterbox",
        
        [[-- Dynamically scaled content not centered --]]
        xALign = "left", 
        yAlign = "top",
        
        [[-- Software anti-aliasing for vector graphics; Performance hit --]]
        antialias = true,
        
        [[-- Default frame rate is 30; Stwitch style gameplay used --]]
        fps = 60,
        
        [[-- Predefined image resolutions for scaling w/o knowledge --]]
        imageSuffix = 
        {
            ["@2"] = 2,
        },
    },
}