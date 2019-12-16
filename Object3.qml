import QtQuick 2.0
import QtMultimedia 5.5
Item {

    function start_animation_3(){ animation_3.start();}
    function pause_animation_3(){ animation_3.pause();}
    function resume_animation_3(){ animation_3.resume();}
    function restart_animation_3(){ animation_3.restart();}
//===============================
    function ballon_visible3(Boolean){ballon3.visible = Boolean;}
//===============================
    function mouse_enable3(Boolean){mouse3.enabled = Boolean;}
    function set_duration_animation_3(){animation_3.duration -= 500;}
//========================
    property double opacity_img_numbers3:1
//========================
    property bool blink3:true
    property bool blink_effect3:true

    function event_explosion3()
    {

        switch(_ballon.function_rand(1,6))
        {

         case 1: ballon3.width = 86;
                 ballon3.height = 195;
                 img_numbers3.source ="10.png";
                 break;

         case 2: ballon3.width = 76;
                 ballon3.height = 185;
                 img_numbers3.source ="20.png";
                 break;

         case 3: ballon3.width = 66;
                 ballon3.height = 175;
                 img_numbers3.source ="30.png";
                 break;

         case 4: ballon3.width = 76;
                 ballon3.height = 185;
                 img_numbers3.source ="40.png";
                 break;
         case 5: ballon3.width = 86;
                 ballon3.height = 195;
                 img_numbers3.source ="50.png";
                 break;
        }

        //===================

         ballon3.visible = false;
         burst2.visible = true;
         img_numbers3.visible = true;
        switch(img_numbers3.source.toString())
        {
        case "qrc:/10.png":_ballon.counter2(10);break;
        case "qrc:/20.png":_ballon.counter2(20);break;
        case "qrc:/30.png":_ballon.counter2(30);break;
        case "qrc:/40.png":_ballon.counter2(40);break;
        case "qrc:/50.png":_ballon.counter2(50);break;
        }

          burst2.x = ballon3.x - 65
          burst2.y = ballon3.y - 65
        //=============
        timer_img_pause3.start()
        //==========
     ballon3.x = _ballon.rand_X(); // случайная позиция x
     ballon3.y = _ballon.rand_Y(); // случайная позиция y
     img_numbers3.x = ballon3.x - 65
     img_numbers3.y = ballon3.y - 65
        //================
        opacity_img_numbers3 = 1;
        img_numbers3.opacity = 1;
        burst2.opacity = 1;
        timer_opacity_img_numbers3.repeat = true;
        //==============
     ballon3.source =_ballon.source_images() // случайный цвет
     ballon3.visible = true;
     animation_3.restart(); // перезапуск анимации
        //===============
        if(progressBar1.value >=0 && progressBar1.value <40)
        {
         animation_3.pause();
        }
    }


    function func_blink3()
    {
        blink_effect3 = false;
        blink_ballon3.start();
    }



    Timer
    {
        id:blink_ballon3
        interval: 200
        repeat: true
        running:false
        onTriggered:
        {
            if(blink3)
            {
                ballon3.visible = true
                blink3 = false;
            }
            else
            {
                ballon3.visible = false
                blink3 = true;
            }
        }
    }


    function stop_func_blink3()
    {
        blink_ballon3.stop();
        blink_effect3 = true;
        ballon3.visible = true;
    }

    function start_slow_anim3()
    {
        animation_3.easing.type = Easing.OutInQuad;

    }

    function use_linear_animation3()
    {
        animation_3.easing.type = Easing.Linear;
    }






    Image
    {
            objectName: "burst2"
            id: burst2
            x: 84
            y: 203
            fillMode: Image.PreserveAspectFit
            visible: false
            source: "burst.png"

            Image {
                id: img_numbers3
                x: 256
                y: 72
                width:50
                height:50
                source: "10.png"
                fillMode: Image.PreserveAspectFit
                anchors.centerIn:parent
                visible:false
            }
     }








    Image
    {
          objectName: "ballon3"
          id: ballon3
          x: 150
          y: 600
          width:46
          height:155
          fillMode: Image.PreserveAspectFit
          source: "ballon3.png"
          visible:true

          onYChanged: {
              if(ballon3.y==(-200))                 
              {   if(blink_effect3)
                  {
                  _ballon.down();
                  healhthbar.source = _ballon.source_healhthbar();
                  }
                  ballon3.x = _ballon.rand_X();
                  ballon3.y = _ballon.rand_Y();
                  animation_3.restart();
                  if(_ballon.current_index()===0)
                  {
                      timer_progress_bar1.stop();
                      alarm_image_emblem.visible = false;
                      progressBar1.visible = false;
                      //================
                      timer_progress_bar2.stop();
                      shield_image_emblem.visible = false;
                      progressBar2.visible = false;
                      //=================
                      timer_progress_bar3.stop()
                      slow_image_emblem.visible = false;
                      progressBar3.visible = false;
                      //===========
                      progressBar1.value = 40;
                      progressBar2.value = 80;
                      progressBar3.value = 320;
                      //===========
                      disable = false;
                      time_r = false;
                      timer_end.running = true;
                      timer_end.start();
                  };
              }
          }

          Audio
          {
            id:sound_poping3
            source: "D:/qt_projects/game/poping.wav"
          }
          MouseArea
          {
              id:mouse3
              anchors.fill:parent
              onClicked:
              {
                  event_explosion3();
                  sound_poping3.play();
              }
          }

          NumberAnimation on y
          {
              objectName:"animation_3"
              id:animation_3
              from:800
              to:-200
              duration:5000
              running:false
              easing.type: Easing.Linear;
              easing.amplitude: 2.0;
              easing.period: 1.5

          }


          Timer
          {
              id:timer_img_pause3
              interval:300
              onTriggered: {timer_opacity_img_numbers3.start()}
          }


           Timer
           {
               id:timer_opacity_img_numbers3
               interval: 100
               repeat: true
               onTriggered:
               {

                   opacity_img_numbers3 -=0.1;
                   img_numbers3.opacity = opacity_img_numbers3;
                   burst2.opacity = opacity_img_numbers3;

                   if(opacity_img_numbers3 <0)
                   {
                       timer_opacity_img_numbers3.repeat = false;
                   }

              }
           }











    }





}
