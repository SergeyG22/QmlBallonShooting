import QtQuick 2.0

Item {
    width: 800
    height: 600
   function start_animation_5()
   {
       animation_violet.start();
       animation_blue1.start();
       animation_blue2.start();
       animation_blue3.start();
       animation_red.start();
       animation_green.start();
       animation_yellow.start();
       animation_pink.start();
   }

    Image
    {

          id: ballon_violet
          x: 415
          y: 609
          fillMode: Image.PreserveAspectFit
          source: "ballon1.png"
          visible:true
          NumberAnimation on y
          {
              id:animation_violet
              from:800
              to:-200
              duration:1000
              running:false
          }
    }

    Image
    {

          id: ballon_blue1
          x: 94
          y: 660
          fillMode: Image.PreserveAspectFit
          source: "ballon2.png"
          visible:true
          NumberAnimation on y
          {
              id:animation_blue1
              from:800
              to:-200
              duration:1000
              running:false
          }
    }


    Image
    {
        id: ballon_red
        x: 186
        y: 630
        fillMode: Image.PreserveAspectFit
        source: "ballon3.png"
        visible:true
        NumberAnimation on y
        {
            id:animation_red
            from:800
            to:-200
            duration:1000
            running:false
        }
    }

    Image
    {
        id: ballon_green
        x: 0
        y: 725
        fillMode: Image.PreserveAspectFit
        source: "ballon4.png"
        visible:true
        NumberAnimation on y
        {
            id:animation_green
            from:800
            to:-200
            duration:1000
            running:false
        }
    }

    Image
    {
        id: ballon_blue2
        x: 301
        y: 609
        fillMode: Image.PreserveAspectFit
        source: "ballon5.png"
        visible:true
        NumberAnimation on y
        {
            id:animation_blue2
            from:800
            to:-200
            duration:1000
            running:false
        }
    }
    Image
    {
        id: ballon_yellow
        x: 530
        y: 630
        fillMode: Image.PreserveAspectFit
        source: "ballon6.png"
        visible:true
        NumberAnimation on y
        {
            id:animation_yellow
            from:800
            to:-200
            duration:1000
            running:false
        }
    }

    Image
    {
        id: ballon_blue3
        x: 622
        y: 660
        fillMode: Image.PreserveAspectFit
        source: "ballon7.png"
        visible:true
        NumberAnimation on y
        {
            id:animation_blue3
            from:800
            to:-200
            duration:1000
            running:false
        }
    }

    Image
    {
        id: ballon_pink
        x: 714
        y: 725
        fillMode: Image.PreserveAspectFit
        source: "ballon8.png"
        visible:true

        NumberAnimation on y
        {
            id:animation_pink
            from:800
            to:-200
            duration:1000
            running:false
        }
    }



}
