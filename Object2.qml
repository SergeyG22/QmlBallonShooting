import QtQuick 2.0
import QtMultimedia 5.5
Item {


    function start_animation_2(){ animation_2.start();}
    function pause_animation_2(){ animation_2.pause();}
    function resume_animation_2(){ animation_2.resume();}
    function restart_animation_2(){ animation_2.restart();}
    function set_duration_animation_2(){animation_2.duration -= 500;}
    //=======================
    function ballon_visible2(Boolean){ballon2.visible = Boolean;}
    //=======================
    function mouse_enable2(Boolean){mouse2.enabled = Boolean;}
    //============
    property double opacity_img_numbers2:1
    //============
    property bool blink2:true
    property bool blink_effect2:true

    function event_explosion2()
    {


        switch(_ballon.function_rand(1,6))
        {
         case 1: ballon2.width = 86;
                 ballon2.height = 195;
                 img_numbers2.source ="10.png";
                 break;
         case 2: ballon2.width = 76;
                 ballon2.height = 185;
                 img_numbers2.source ="20.png";
                 break;
         case 3: ballon2.width = 66;
                 ballon2.height = 175;
                 img_numbers2.source ="30.png";
                 break;
         case 4: ballon2.width = 76;
                 ballon2.height = 185;
                 img_numbers2.source ="40.png";
                 break;
         case 5: ballon2.width = 86;
                 ballon2.height = 195;
                 img_numbers2.source ="10.png";
                 break;
        }

        //===================

         ballon2.visible = false;
         burst1.visible = true;
         img_numbers2.visible = true;
        switch(img_numbers2.source.toString())
        {
        case "qrc:/10.png":_ballon.counter1(10);break;
        case "qrc:/20.png":_ballon.counter1(20);break;
        case "qrc:/30.png":_ballon.counter1(30);break;
        case "qrc:/40.png":_ballon.counter1(40);break;
        case "qrc:/50.png":_ballon.counter1(50);break;
        }

          burst1.x = ballon2.x - 65
          burst1.y = ballon2.y - 65
        //===========
          timer_img_pause2.start()
        //==========
          img_numbers2.x = ballon2.x - 65
          img_numbers2.y = ballon2.y - 65

          //==============
        opacity_img_numbers2 = 1;
        img_numbers2.opacity = 1;
        burst1.opacity = 1;
        timer_opacity_img_numbers2.repeat = true;

          //===================
      ballon2.x = _ballon.rand_X(); // случайная позиция x
      ballon2.y = _ballon.rand_Y(); // случайная позиция y
     ballon2.source =_ballon.source_images() // случайный цвет
     ballon2.visible = true;
     animation_2.restart(); // перезапуск анимации
        //=================
        if(progressBar1.value >=0 && progressBar1.value <40)
        {
         animation_2.pause();
        }
       }

    function func_blink2()
    {
        blink_effect2 = false;
        blink_ballon2.start();
    }

    function stop_func_blink2()
    {
        blink_ballon2.stop();
        blink_effect2 = true;
        ballon2.visible = true;
    }

    function start_slow_anim2()
    {
        animation_2.easing.type = Easing.OutInQuad;

    }


    function use_linear_animation2()
    {
        animation_2.easing.type = Easing.Linear;
    }



    Timer
    {
        id:blink_ballon2
        interval: 200
        repeat: true
        running:false
        onTriggered:
        {
            if(blink2)
            {
                ballon2.visible = true
                blink2 = false;
            }
            else
            {
                ballon2.visible = false
                blink2 = true;
            }
        }
    }


    Image
    {
            objectName: "burst1"
            id: burst1
            x: 84
            y: 203
            fillMode: Image.PreserveAspectFit
            visible: false
            source: "burst.png"

            Image {
                id: img_numbers2
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
          objectName: "ballon2"
          id: ballon2
          x: 350
          y: 600
          fillMode: Image.PreserveAspectFit
          source: "ballon2.png"
          visible:true

          onYChanged: {
              if(ballon2.y==(-200))                 
              {   if(blink_effect2)
                 {
                    _ballon.down();
                    healhthbar.source = _ballon.source_healhthbar();
                  }
                  ballon2.x = _ballon.rand_X();
                  ballon2.y = _ballon.rand_Y();
                  animation_2.restart();
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
                      time_r = false;
                      timer_end.running = true;
                      timer_end.start();
                      disable = false;
                  };
              }
          }

          Audio
          {
            id:sound_poping2
            source: "D:/qt_projects/game/poping.wav"
          }
          MouseArea
          {
              id:mouse2
              anchors.fill:parent
              onClicked:
              {
                  event_explosion2();
                  sound_poping2.play();
              }
          }

          NumberAnimation on y
          {
              objectName:"animation_2"
              id:animation_2
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
              id:timer_img_pause2
              interval:300
              onTriggered: {timer_opacity_img_numbers2.start()}
          }


           Timer
           {
               id:timer_opacity_img_numbers2
               interval: 100
               repeat: true
               onTriggered:
               {

                   opacity_img_numbers2 -=0.1;
                   img_numbers2.opacity = opacity_img_numbers2;
                   burst1.opacity = opacity_img_numbers2;

                   if(opacity_img_numbers2 <0)
                   {
                       timer_opacity_img_numbers2.repeat = false;
                   }

              }
           }




    }
}
