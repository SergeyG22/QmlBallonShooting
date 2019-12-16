import QtQuick 2.0
import QtMultimedia 5.5
Item
{
    function tmr_start(){tmr_r.start();}
    function tmr_restart(){tmr_r.restart();}
    function tmr_stop(){ tmr_r.stop();}
//================
    function start_animation_4(){ animation_4.start();}
    function pause_animation_4(){ animation_4.pause();}
    function resume_animation_4(){ animation_4.resume();}
    function restart_animation_4(){ animation_4.restart();}
//===============================
    function ballon_visible4(Boolean){ballon4.visible = Boolean;}
//===============================
    function mouse_enable4(Boolean){mouse4.enabled = Boolean;}

//===========================
    function start_slow_anim4()
    {
        animation_4.easing.type = Easing.OutInQuad;;
    }

    function start_clock()
    {       
        clock_timer.start();
        clock_stop.start();
    }






    function use_linear_animation4()
    {
        animation_4.easing.type = Easing.Linear;
    }

    function event_explosion4()
    {

        ballon4.visible = false;                         // скрываем шарик
        burst3.visible = true;                           // отображаем эффект
        timer_hide.start();                              // скрываем эффект
        burst3.x = ballon4.x;
        burst3.y = ballon4.y;
        burst3.width = 80;
        burst3.height = 80;
        animation_4.stop();
      //===================
        ballon4.x = _ballon.rand_X();
        ballon4.y = 600;
        tmr_r.interval = _ballon.interval();
        if(progressBar1.value >=0 && progressBar1.value <40)
        {
         animation_4.pause();
        }
        else {tmr_r.start();}
      //=================
        burst3.source = _ballon.source_effect();       // присваиваем эффект
        switch(burst3.source.toString())
       {

       case "qrc:/heart.png":
       {

            timer_hide.interval = 1500;
            image_small_heart.visible = true;
             break;
       }

       case "qrc:/clocks1.png":
       {
           timer_hide.interval = 1500;
           image_alarm.visible = true;
           break;
       }

       case "qrc:/bomb.png":
       {
           timer_hide.interval = 1500;
           image_bomb.visible = true;
           break;
       }

       case "qrc:/shield.png":
       {
           timer_hide.interval = 1500;
           image_shield.visible = true;
           break;
       }

       case "qrc:/slow.png":
       {
           timer_hide.interval = 1500;
           image_slow.visible = true;
       }

      }


    }



    Image
    {
            objectName: "burst3"
            id: burst3
            width:150
            height: 150
            fillMode: Image.PreserveAspectFit
            visible: false
            source: "heart.png"
     }

    Image
    {
          objectName: "ballon4"
          id: ballon4
          x: 350
          y: 600
          fillMode: Image.PreserveAspectFit
          source: "ballonpresent.png"
          visible:false

          onYChanged:
          {

             if(ballon4.y==(-300))
             {
                 ballon4.x = _ballon.rand_X();
                 ballon4.y = 600;
                 tmr_r.interval = _ballon.interval();
                 tmr_r.start();
             }
          }


          Audio
          {
            id:sound_poping4
            source: "D:/qt_projects/game/poping.wav"
          }
          MouseArea
          {
              id:mouse4
              anchors.fill:parent
              onClicked:
              {
                  event_explosion4();
                  sound_poping4.play();
              }
          }


          NumberAnimation on y
          {
              objectName:"animation_4"
              id:animation_4
              from:800
              to:-300
              duration:9000
              running:false
          }



          Timer  // интeрвал задержки для clock
          {
              id:clock_timer
              interval:5300
              running:false
              onTriggered:
              {
                  clock_stop.stop();
              }

          }

          Timer
          {
              id:clock_stop
              interval:10
              running:false
              repeat:true
              onTriggered:
              {
                  animation_1.pause();
                  anim2.pause_animation_2();
                  anim3.pause_animation_3();
                  anim4.pause_animation_4();
                  anim5.pause_animation_5();
              }

          }







          Timer // генерирует интервал появления
          {   objectName:"tmr_r"
              id:tmr_r
              interval:4000                   // повторный запуск таймера если взрыв
              onTriggered:                    // или ушел за экран
              {
                  animation_4.restart();
                  ballon4.visible = true;                  
              }

          }


          Timer
          {
             id:timer_hide
             interval: 1000
             onTriggered:
             {
                 burst3.visible= false
             }
          }



    }
}
















