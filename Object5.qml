import QtQuick 2.0
import QtMultimedia 5.5

Item {

    function start_animation_5(){ animation_5.start();}
    function pause_animation_5(){ animation_5.pause();}
    function resume_animation_5(){ animation_5.resume();}
    function restart_animation_5(){ animation_5.restart();}
//===============================
    function ballon_visible5(Boolean){ballon5.visible = Boolean;}
//===============================
    function mouse_enable5(Boolean){mouse5.enabled = Boolean;}
    function set_duration_animation_5(){animation_5.duration -= 500;}
//====================
    property double opacity_img_numbers5:1
//====================
    property bool blink5:true
    property bool blink_effect5:true



    function event_explosion5()
    {

        switch(_ballon.function_rand(1,6))
        {

         case 1: ballon5.width = 86;
                 ballon5.height = 195;
                 img_numbers5.source ="10.png";
                 break;

         case 2: ballon5.width = 76;
                 ballon5.height = 185;
                 img_numbers5.source ="20.png"
                 break;

         case 3: ballon5.width = 66;
                 ballon5.height = 175;
                 img_numbers5.source ="30.png";
                 break;

         case 4: ballon5.width = 76;
                 ballon5.height = 185;
                 img_numbers5.source ="40.png";
                 break;
         case 5: ballon5.width = 86;
                 ballon5.height = 195;
                 img_numbers5.source ="50.png"
                 break;
        }

        //===================

        ballon5.visible = false;
        burst4.visible = true;
        img_numbers5.visible = true;
        //==========
        switch(img_numbers5.source.toString())
        {
        case "qrc:/10.png":_ballon.counter3(10);break;
        case "qrc:/20.png":_ballon.counter3(20);break;
        case "qrc:/30.png":_ballon.counter3(30);break;
        case "qrc:/40.png":_ballon.counter3(40);break;
        case "qrc:/50.png":_ballon.counter3(50);break;
        }


          burst4.x = ballon5.x - 65
          burst4.y = ballon5.y - 65
       //   timer_8.start()
        timer_img_pause5.start()
         //===================
     ballon5.x = _ballon.rand_X(); // случайная позиция x
     ballon5.y = _ballon.rand_Y(); // случайная позиция y
     img_numbers5.x = ballon5.x - 65
     img_numbers5.y = ballon5.y - 65

        //================
        opacity_img_numbers5 = 1;
        img_numbers5.opacity = 1;
        burst4.opacity = 1;
        timer_opacity_img_numbers5.repeat = true;
        //==============
     ballon5.source =_ballon.source_images() // случайный цвет
     ballon5.visible = true;
     animation_5.restart();
        //=============
        if(progressBar1.value >=0 && progressBar1.value <40)
        {
         animation_5.pause();
        }
    }

    function func_blink5()
    {
        blink_effect5 = false;
        blink_ballon5.start();
    }

    function start_slow_anim5()
    {
        animation_5.easing.type = Easing.OutInQuad;       
    }


    function stop_func_blink5()
    {
        blink_ballon5.stop();
        blink_effect5 = true;
        ballon5.visible = true;
    }


    function use_linear_animation5()
    {
        animation_5.easing.type = Easing.Linear;
    }

    Timer
    {
        id:blink_ballon5
        interval: 200
        repeat: true
        running:false
        onTriggered:
        {
            if(blink5)
            {
                ballon5.visible = true
                blink5 = false;
            }
            else
            {
                ballon5.visible = false
                blink5 = true;
            }
        }
    }


    Image
    {
            objectName: "burst4"
            id: burst4
            x: 84
            y: 203
            fillMode: Image.PreserveAspectFit
            visible: false
            source: "burst.png"

            Image {
                id: img_numbers5
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
          objectName: "ballon5"
          id: ballon5
          x: 150
          y: 600
          width:46
          height:155
          fillMode: Image.PreserveAspectFit
          source: "ballon4.png"
          visible:true

          onYChanged: {
              if(ballon5.y==(-200))
              {
                  if(blink_effect5)
                  {
                  _ballon.down();
                  healhthbar.source = _ballon.source_healhthbar();
                  }
                  ballon5.x = _ballon.rand_X();
                  ballon5.y = _ballon.rand_Y();
                  animation_5.restart();
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
            id:sound_poping5
            source: "D:/qt_projects/game/poping.wav"
          }
          MouseArea
          {
              id:mouse5
              anchors.fill:parent
              onClicked:
              {
                  event_explosion5();
                  sound_poping5.play();
              }
          }

          NumberAnimation on y
          {
              objectName:"animation_5"
              id:animation_5
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
              id:timer_img_pause5
              interval:300
              onTriggered: {timer_opacity_img_numbers5.start()}
          }


           Timer
           {
               id:timer_opacity_img_numbers5
               interval: 100
               repeat: true
               onTriggered:
               {

                   opacity_img_numbers5 -=0.1;
                   img_numbers5.opacity = opacity_img_numbers5;
                   burst4.opacity = opacity_img_numbers5;

                   if(opacity_img_numbers5 <0)
                   {
                       timer_opacity_img_numbers5.repeat = false;
                   }

              }
           }




    }





}
