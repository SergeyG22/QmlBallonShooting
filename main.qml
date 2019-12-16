import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 1.6
import QtQuick.Controls 2.4
import QtQuick.Controls.Styles 1.4
import QtMultimedia 5.5

Window {
    id:mainwindow
    visible: true
    width:  800
    height: 600
    maximumHeight: height
    maximumWidth: width
    minimumHeight: height
    minimumWidth: width
    title: qsTr("стрельба по шарикам")

    property bool play:true
    property bool icon_play:true
    property bool time_r:true
    //===============
    property double opacity_logo:0
    property double opacity_up:0
    property double opacity_img_numbers:1
    //===============
    property bool lvlup:true
    property bool disable:true
    //====================
    property int second:59
    property int minute:2
   //================
    property bool strt:true
  //==================
    property int lvl:1
 //===================
    property bool blink:true
    property bool blink_effect:true
 //===================
    property int number_sky:0
    property bool value:true
    property var y_pos:[500,450,400] // позиции Y для прогресс-баров
    property var y_var:[true,true,true] // истина-ложь для прогресс-баров (если true - прогресс-бар помещается в свободную учейку)
//====================
    property var a:0
    property var b:0
    property var c:0
//====================
    property var save_number1:0
    property var save_number2:0
    property var save_number3:0
//====================
    property var complexity: "str"
//================
    property int sec_start:4



      function event_explosion1()
      {


                    switch(_ballon.function_rand(1,6))
                    {

                     case 1: ballon1.width = 86;
                             ballon1.height = 195;
                             img_numbers.source ="10.png";
                             break;

                     case 2: ballon1.width = 76;
                             ballon1.height = 185;
                             img_numbers.source = "20.png";
                             break;

                     case 3: ballon1.width = 66;
                             ballon1.height = 175;
                             img_numbers.source = "30.png";
                             break;

                     case 4: ballon1.width = 76;
                             ballon1.height = 185;
                             img_numbers.source = "40.png";
                             break;
                     case 5: ballon1.width = 86;
                             ballon1.height = 195;
                             img_numbers.source = "50.png";                         
                             break;
                    }

                    //===================

                    ballon1.visible = false;
                    burst.visible = true;
                    img_numbers.visible = true;

                    switch(img_numbers.source.toString())
                    {
                    case "qrc:/10.png":_ballon.counter(10);break;
                    case "qrc:/20.png":_ballon.counter(20);break;
                    case "qrc:/30.png":_ballon.counter(30);break;
                    case "qrc:/40.png":_ballon.counter(40);break;
                    case "qrc:/50.png":_ballon.counter(50);break;
                    }

                    burst.x = ballon1.x -65
                    burst.y = ballon1.y -65
                    timer_img_pause.start()
                    //=============
                    ballon1.x = _ballon.rand_X(); // случайная позиция x
                    ballon1.y = _ballon.rand_Y(); // случайная позиция y
                    img_numbers.x = ballon1.x - 65
                    img_numbers.y = ballon1.y - 65
                    ballon1.source =_ballon.source_images() // случайный цвет
                    opacity_img_numbers = 1;
                    img_numbers.opacity = 1;
                    burst.opacity = 1;
                    timer_opacity_img_numbers.repeat = true;
                    ballon1.visible = true; // видимость шарика вкл
                    animation_1.restart(); // перезапуск анимации
                    //==============
                    if(progressBar1.value >=0 && progressBar1.value <40)
                    {
                     animation_1.pause();
                    }
                   //===================================
}

     Timer
     {
         id:blink_ballon1
         interval: 200
         repeat: true
         running:false
         onTriggered:
         {
             if(blink)
             {
                 ballon1.visible = true             
                 blink = false;
             }
             else
             {
                 ballon1.visible = false
                 blink = true;
             }
         }
     }

     Timer
     {   id:stopped_blink1
         interval: 10000
         onTriggered:
         {
             blink_ballon1.stop();
             blink_effect = true;
             ballon1.visible = true;
         }

     }

    Image
    {
        objectName: "sky"
        id: sky
        x: 0
        y: 0
        fillMode: Image.PreserveAspectFit
        source: "sky.jpg"
    }





//========================================= Новый таймер!
        Timer
        {
           id:time
           interval: 1000
           running:false
           repeat:true
           onTriggered:
           {  if(second > 10)
              {
               second-=1;
              }
               else if(second == 10)
               {
               second-=1;
               element1.x+=8;
               element0.x+=16;
               element1.visible = true;
               }

               else if(second<10 && second >0)
               {
                  second-=1;
               }
               else if(second == 0)                  
               {   minute-=1;
                   element1.x-=8;
                   element0.x-=16;

                   if(minute>=0)
                   {
                       second = 59;
                   }
                   else {                       
                       second = 59;
                       minute = 2;
                   //================================
                       switch(complexity)
                      {
                      case "easy":
                      {
                       _ballon.set_start_speed(6000.0,7000.0);
                       _ballon.setter_for_interval(5000.0,10000.0);

                       break;
                       }

                       case "middle":
                       {
                        _ballon.set_start_speed(4500.0,6000.0);
                        _ballon.setter_for_interval(20000.0,30000.0);

                        break;
                        }

                       case "hard":
                      {
                        _ballon.set_start_speed(3500.0,4500.0);
                        _ballon.setter_for_interval(40000.0,50000.0);

                        break;
                      }

                      }

               //============================

                       value = true;
                       time.stop();
                       //===============

                       timer_up_2.restart();
                       lvl++;
              //============
                       anim4.tmr_stop(); // останавливает таймер появления шарика с коробкой
             //============
                       animation_1.pause();
                       anim2.pause_animation_2();
                       anim3.pause_animation_3();
                       anim4.pause_animation_4();
                       anim5.pause_animation_5();
             //============
                      mouse.enabled = false;
                      anim2.mouse_enable2(false);
                      anim3.mouse_enable3(false);
                      anim4.mouse_enable4(false);
                      anim5.mouse_enable5(false);
                      change_fone.start();
            //====================
                      cicrle1_mouse.enabled = false;
                      cicrle2_mouse.enabled = false;
                      cicrle3_mouse.enabled = false;
                      cicrle4_mouse.enabled = false;
                      cicrle5_mouse.enabled = false;

                   }

                   element1.visible = false;
               }

//==================================


    if(minute==1 && second==59)
    {
      animation_1.duration -=500;
      anim2.set_duration_animation_2();
      anim3.set_duration_animation_3();
      anim5.set_duration_animation_5();
    }

    if(minute==0 && second==59)
   {
     animation_1.duration -=500;
     anim2.set_duration_animation_2();
     anim3.set_duration_animation_3();
     anim5.set_duration_animation_5();
   }

//===================================

           }
        }
//====================================

        Image
        {
            objectName: "ballon1"
            id: ballon1
            x: 100
            y: 600
            visible:true
            fillMode: Image.PreserveAspectFit
            source: "ballon1.png"
            onYChanged: {

                 if(ballon1.y==(-200))
                {   if(blink_effect)
                    { _ballon.down();
                      healhthbar.source = _ballon.source_healhthbar();
                     }
                     //===============
                    ballon1.x = _ballon.rand_X();
                    ballon1.y = _ballon.rand_Y();
                    animation_1.restart();
                    //==================

                     if(_ballon.current_index()==0)
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
                id:sound_game
                source:"D:/qt_projects/game/romantic.mp3"
            }


            Audio
            {
              id:sound_poping1
              source: "D:/qt_projects/game/poping.wav"
            }
            MouseArea
            {
                anchors.fill:parent
                id:mouse
                onClicked:
                {
                    event_explosion1();
                    sound_poping1.play();
                }
            }

            NumberAnimation on y
            {
                objectName:"animation_1"
                id:animation_1
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
               id:timer_img_pause
               interval:300
               onTriggered: {timer_opacity_img_numbers.start()}
           }

            Timer
            {
                id:timer_opacity_img_numbers
                interval: 100
                repeat: true
                onTriggered:
                {
                    opacity_img_numbers -=0.1;
                    img_numbers.opacity = opacity_img_numbers;
                    burst.opacity = opacity_img_numbers;
                    if(opacity_img_numbers <0)
                    {
                        timer_opacity_img_numbers.repeat = false;
                    }

               }
            }
        }

        Object2{ id:anim2 }
        Object3{ id:anim3 }
        Object4{ id:anim4 }
        Object5{ id:anim5 }
        AirBalloons{id:airballons

        Text {
            id: element4
            x: 309
            y: 287
            text: qsTr("5")
            font.pixelSize: 75
            color:"#85f50c"
            styleColor: "black"
            style:Text.Outline
            font.bold: true
            anchors.centerIn: parent
            visible:false
        }





        }





        ProgressBar {
            id: progressBar1
            x: 17
            y: 400
            width: 200
            from:0
            to:40
            value:40
            visible:false
            ColorAnimation
            {
                from: "white"
                to: "black"
                duration: 200
            }
            background:
            Rectangle
            {
                 radius: 2
                 color: "gray"
                 implicitWidth: 200
                 implicitHeight: 18
             }
        }

        ProgressBar
        {
            id: progressBar2
            x: 17
            y: 450
            value:80
            from:0
            to:80
            visible:false
            ColorAnimation
            {
                from: "white"
                to: "black"
                duration: 200
            }
            background:
            Rectangle
            {
                radius: 2
                color: "gray"
                implicitWidth: 200
                implicitHeight: 18
             }
        }



        ProgressBar {
            id: progressBar3
            x: 17
            y: 500
            value:320
            from:0
            to:320
            visible:false
            ColorAnimation
            {
                from: "white"
                to: "black"
                duration: 200
            }
            background:
            Rectangle
            {
                 radius: 2
                 color: "gray"
                 implicitWidth: 200
                 implicitHeight: 18
            }
        }


        Image
        {
            objectName: "burst"
            id: burst
            x: 84
            y: 203
            fillMode: Image.PreserveAspectFit
            visible: false
            source: "burst.png"
                Image {
                    id: img_numbers
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





        Rectangle
        {
            id: rectangle
            x: 0
            y: 538
            width: 800
            height: 62
            color: "#d94de6"          
         }


        Text {
            id: element0
            x: 507
            y: 556
            width: 55
            height: 21
            text: second;
            font.pixelSize: 23
            font.bold: true

        }

        Text {
            id: element1
            x: 500
            y: 556
            text: qsTr("0")
            visible: false
            font.pixelSize: 23
            font.bold: true
        }

        Text {
            id: element2
            x: 480
            y: 556
            width: 14
            height: 21
            text: minute
            font.pixelSize: 23
            font.bold: true
        }

        Text {
            id: element3
            x: 497
            y: 556
            width: 7
            height: 21
            text: qsTr(":")
            font.pixelSize: 23
            font.bold: true
        }







        Text {
            id: element
            x: 707
            y: 573
            width: 36
            text: qsTr("level "+ lvl)
            font.bold: true
            font.pixelSize: 18
             }
        Image
        {
            id: image
            width:65
            height: 58
            x: 400
            y: 541
            fillMode: Image.PreserveAspectFit
            source: "alarm_clock.png"
            visible:true
        }


    Image
    {
        objectName: "img_game_over"
        id: image1
        x: 0
        y: 0
        source: "game_over.png"
        fillMode: Image.PreserveAspectFit
        visible:false
    }

    Image
    {
        objectName: "level_up"
        id: image3
        x: 640
        y: 350
        width: 135
        height: 163
        source: "levelup.png"
        fillMode: Image.PreserveAspectFit
        visible:true
        opacity:0
    }

    Image {
        objectName: "level_up"
        id: image4
        x: 640
        y: 350
        width: 135
        height: 163
        source: "levelup1.png"
        fillMode: Image.PreserveAspectFit
        visible:true
        opacity:0
    }

    MainWindow{ id:window; x: 0;y: 0



    }

    Image
    {
        objectName: "healhthbar"
        id: healhthbar
        x: 497
        y: 544
        width: 356
        height: 51
        fillMode: Image.PreserveAspectFit
        visible: false
        source: "healthbar100.png"
    }

    Image {
        id: cicrle1
        x: 80
        y: 540
        width: 59
        fillMode: Image.PreserveAspectFit
        visible: false
        source: "circle1.png"       
        Image
        {
            id: image_small_heart
            anchors.centerIn: parent
            x: 333
            y: 520
            source: "smallheart.png"
            fillMode: Image.PreserveAspectFit
            visible:true
            MouseArea
            {   id:cicrle1_mouse;
                anchors.fill:parent
                onClicked:
                {
                  image_small_heart.visible = false;
                   _ballon.up();
                  healhthbar.source = _ballon.source_healhthbar();
                }

            }
        }
    }

    Image {
        id: cicrle2
        x: 140
        y: 540
        width: 59
        fillMode: Image.PreserveAspectFit
        visible: false
        source: "circle2.png"
        Image {
            id: image_bomb
            anchors.centerIn: parent
            x: 99
            y: 527
            source: "bomb.png"
            fillMode: Image.PreserveAspectFit
            visible:true
            MouseArea
            {   id:cicrle2_mouse;
                anchors.fill:parent
                onClicked:
                {
                   image_bomb.visible = false;
                    event_explosion1();
                    anim2.event_explosion2();
                    anim3.event_explosion3();
                    //==============
                    if((_ballon.get_ballon4_y_pos() > -220) && (_ballon.get_ballon4_y_pos() < 450) )
                        { anim4.event_explosion4();}
                    //==============
                    anim5.event_explosion5();
                }
            }
        }
    }

    Image {
        id: cicrle3
        x: 200
        y: 540
        width: 59
        fillMode: Image.PreserveAspectFit
        visible: false
        source: "circle3.png"
        Image {
            id: image_alarm
            anchors.centerIn: parent
            x: 49
            y: 0
            source: "alarm.png"
            fillMode: Image.PreserveAspectFit
            visible:true

            MouseArea
            {   id:cicrle3_mouse;
                anchors.fill:parent
                onClicked:
                {
                    for(a=0;a<3;a++)
                    {
                        if(y_var[a]==true)
                        {
                            y_var[a]=false;
                            progressBar1.y = y_pos[a];
                            save_number1 = a; // сохраняем текущую позицию для возврата true после паузы
                            a = 0;            // сбрасываем индекс для использования другими прогрессбарами
                            break;
                        }
                    }
                    image_alarm.visible = false;
                    time.stop();
                    //==============
                    animation_1.pause();
                    anim2.pause_animation_2();
                    anim3.pause_animation_3();
                    anim4.pause_animation_4();
                    anim5.pause_animation_5();
                    //=================                
                    anim4.tmr_stop();

                    timer_progress_bar1.start();
                }
            }
        }
    }

    Image {
        id: cicrle4
        x: 260
        y: 540
        width: 59
        fillMode: Image.PreserveAspectFit
        visible: false
        source: "circle4.png"
        Image {
            id: image_shield
            anchors.centerIn: parent
            x: 247
            y: 3
            source: "shield.png"
            fillMode: Image.PreserveAspectFit
            visible:true
            MouseArea
            {   id:cicrle4_mouse;
                anchors.fill:parent
                onClicked:
                {
                    image_shield.visible = false;
                    //===========
                    for(a=0;a<3;a++)
                    {                                                 // y_pos y_var
                        if(y_var[a]==true)
                        {
                            y_var[a]=false;
                            progressBar2.y = y_pos[a];
                            save_number2 = a; // сохраняем текущую позицию для возврата true после паузы
                            a = 0;            // сбрасываем индекс для использования другими прогрессбарами
                            break;
                        }
                    }                    
                    //==============
                    blink_effect = false;
                    blink_ballon1.start(); // таймер запуска мерцания                
                    timer_progress_bar2.start();
                    //============
                    anim2.func_blink2();
                    anim3.func_blink3();
                    anim5.func_blink5();                    
                }
            }

        }
    }

Image {
    id: cicrle5
    x: 320
    y: 540
    width: 59
    fillMode: Image.PreserveAspectFit
    visible: false
    source: "circle5.png"

    Image {
        anchors.centerIn: parent
        id: image_slow
        x: 427
        y: 527
        source: "slow.png"
        fillMode: Image.PreserveAspectFit
        visible:true
        MouseArea
        {   id:cicrle5_mouse;
            anchors.fill:parent
            onClicked:
            {
                for(a=0;a<3;a++)
                {                                                 // y_pos y_var
                    if(y_var[a]==true)
                    {
                        y_var[a]=false;
                        progressBar3.y = y_pos[a];
                        save_number3 = a; // сохраняем текущую позицию для возврата true после паузы
                        a = 0;            // сбрасываем индекс для использования другими прогрессбарами
                        break;
                    }
                }

              //===============
                image_slow.visible = false;
                animation_1.easing.type = Easing.OutInQuad;                
                timer_progress_bar3.start();
               //======================
                anim2.start_slow_anim2();
                anim3.start_slow_anim3();
                anim4.start_slow_anim4();
                anim5.start_slow_anim5();
            }

        }
    }
}







//==========================

Image{
      id:alarm_image_emblem
      x: progressBar1.x + 205
      y: progressBar1.y-13
      source: "alarm.png"
      width: 40
      height:40
      visible:false
}

Image{
      id:shield_image_emblem
      x: progressBar2.x + 205
      y: progressBar2.y-13
      source: "shield.png"
      width: 40
      height:40
      visible:false
}

Image {
    id: slow_image_emblem
    x: progressBar3.x + 205
    y: progressBar3.y - 13
    source: "slow.png"
    width:40
    height:40
    visible:false
}



    Image {
        objectName: "image_play"
        id: image_play
        x: 10
        y: 540
        width: 59
        height: 59
        source: "play.png"
        visible: false
        fillMode: Image.PreserveAspectFit
       MouseArea
       {
          anchors.fill:parent
          onClicked:
          {
             if(disable)
             {
              if(icon_play)
              {

               cicrle1.visible = false;
               cicrle2.visible = false;
               cicrle3.visible = false;
               cicrle4.visible = false;
               cicrle5.visible = false;
              //============
                  animation_1.pause();
                  anim2.pause_animation_2();
                  anim3.pause_animation_3();
                  anim4.pause_animation_4();
                  anim5.pause_animation_5();
                  //===========
                  anim4.tmr_stop();
                  //=========
                  if(progressBar1.value >=0 && progressBar1.value <40)
                  {
                   anim4.tmr_stop();
                   //=======
                   animation_1.pause();
                   anim2.pause_animation_2();
                   anim3.pause_animation_3();
                   anim4.pause_animation_4();
                   anim5.pause_animation_5();
                  }

              //=====================
              button.visible = true   // отобразить кнопки
              button1.visible = true
              button2.visible = true
              button3.visible = true
              button4.visible = true
              //======================
              window.h_fone = true             
              //======================

                  if(progressBar1.value >=0 && progressBar1.value <40)
                  { anim4.tmr_stop();
                   timer_progress_bar1.stop();
                   time.stop();
                      progressBar1.visible = false;
                      if(alarm_image_emblem.visible) {alarm_image_emblem.visible = false;}
                  }


                  if(progressBar2.value >=0 && progressBar2.value <80)
              { timer_progress_bar2.stop();
                progressBar2.visible = false;
                if(shield_image_emblem.visible) {shield_image_emblem.visible = false;}
                  }

                  if(progressBar3.value >=0 && progressBar3.value < 320)
                {
                   timer_progress_bar3.stop();
                   progressBar3.visible = false;
                      if(slow_image_emblem.visible) {slow_image_emblem.visible = false;}

                  }


              //======================
              mouse.enabled = false  // отключить мышь для всех динамических обьектов
              anim2.mouse_enable2(false)
              anim3.mouse_enable3(false)
              anim4.mouse_enable4(false)
              anim5.mouse_enable5(false)
              //===================
              counter_1.visible = false
              //====================
              ballon1.visible = false;  // скрыть шарики
              anim2.ballon_visible2(false);
              anim3.ballon_visible3(false);
              anim4.ballon_visible4(false);
              anim5.ballon_visible5(false);
              //====================
              image_play.source = "stop.png"
              icon_play = false;
              //====================
              healhthbar.visible = false;
              text_total.visible = false;
              //=================

              }
              else
              {
                  icon_play = true;
                  image_play.source = "play.png"
                  //==================

                  if(progressBar1.value >=0 && progressBar1.value <40)
                  {
                   animation_1.pause();
                   anim2.pause_animation_2();
                   anim3.pause_animation_3();
                   anim4.pause_animation_4();
                   anim5.pause_animation_5();
                   //========
                   anim4.tmr_stop();
                  }

                  else{
                      animation_1.resume()
                      anim2.resume_animation_2()
                      anim3.resume_animation_3()
                      anim4.resume_animation_4()
                      anim5.resume_animation_5()
                      //========
                      anim4.tmr_start();
                  }
                  //======================
                  ballon1.visible = true;  // отобразить шарики
                  anim2.ballon_visible2(true);
                  anim3.ballon_visible3(true);
                  anim4.ballon_visible4(true);
                  anim5.ballon_visible5(true);
                  counter_1.visible = true; // отобразить текст

                  //========================
                  window.h_fone = false; // скрыть фон
                  //========================
                  if(progressBar2.value >=0 && progressBar2.value <80)
                 {   progressBar2.visible = true;
                      timer_progress_bar2.start();
                      if(shield_image_emblem.visible == false) {shield_image_emblem.visible = true;image_shield.visible = true; }
                  }

                  if(progressBar1.value >=0 && progressBar1.value <40)
                  {   anim4.tmr_stop();   //останавливает таймер появления особого шарика на время будильника
                      progressBar1.visible = true;
                      timer_progress_bar1.start();
                      if(alarm_image_emblem.visible == false) { alarm_image_emblem.visible = true;image_alarm.visible = true; }
                  }

                  if(progressBar3.value >0 && progressBar3.value < 320)
                  {
                      progressBar3.visible = true;                  
                      timer_progress_bar3.start();
                      if(slow_image_emblem.visible == false) {slow_image_emblem.visible = true; image_slow.visible = true;}
                  }
                  //====================
                  button.visible = false;
                  button1.visible = false;// скрыть кнопки
                  button2.visible = false;
                  button3.visible = false;
                  button4.visible = false;
                  //==========================
                  mouse.enabled = true  // включить мышь для всех динамических обьектов
                  anim2.mouse_enable2(true)
                  anim3.mouse_enable3(true)
                  anim4.mouse_enable4(true)
                  anim5.mouse_enable5(true)
                  //==========================
                  healhthbar.visible = true;
                  text_total.visible = true;
                  //=================
                  cicrle1.visible = true;
                  cicrle2.visible = true;
                  cicrle3.visible = true;
                  cicrle4.visible = true;
                  cicrle5.visible = true;
                  //==================

              }
             }

          }


       }
    }

    Button {
        id: button
        x: 365
        y: 179
        width: 130
        height: 46
        text: qsTr("Новая игра")
        font.family: "Tahoma"
        font.italic: false
        font.bold: false
        font.pointSize: 11
        visible:true
        onClicked:
        {
            //============
            button.visible = false;
            button1.visible = false;
            button2.visible = false;
            button3.visible = false;
            button4.visible = false;
            dialog.open();


    }

    }

    Dialog
    {
        anchors.centerIn:parent
        objectName: "dialog"
        id: dialog
        title: "Начать новую игру?"
        standardButtons: Dialog.Ok | Dialog.Cancel
        onAccepted:                        
        {

            //============
            button5.visible = true;
            button6.visible = true;
            button7.visible = true;
            button8.visible = true;
          //=================
            image1.visible = false;
            window.h_fone = true;
            healhthbar.visible = false;
            text_total.visible = false
            counter_1.visible = false;
            cicrle1.visible = false;
            cicrle2.visible = false;
            cicrle3.visible = false;
            cicrle4.visible = false;
            cicrle5.visible = false;
          //=================
            image_play.visible = false
            disable = true
            icon_play = true
        }

        onRejected:
        {
            //===============
            image1.visible = false;
            window.h_fone = true;
            healhthbar.visible = false;
            text_total.visible = false
            counter_1.visible = false;
            cicrle1.visible = false;
            cicrle2.visible = false;
            cicrle3.visible = false;
            cicrle4.visible = false;
            cicrle5.visible = false;
            //==================
            image_play.visible = false
            disable = true
            icon_play = true
            //================
        button.visible = true;
        button1.visible = true;        
        button3.visible = true;
        button4.visible = true;
            //=============
            cicrle1_mouse.enabled = false;
            cicrle2_mouse.enabled = false;
            cicrle3_mouse.enabled = false;
            cicrle4_mouse.enabled = false;
            cicrle5_mouse.enabled = false;
        }
    }

    Button {
        id: button1
        x: 366
        y: 280
        width: 130
        height: 46
        text: qsTr("Настройки")
        font.family: "Tahoma"
        font.pointSize: 11
        visible:true
        onClicked:
        {
            console.log("настройки еще не готовы!");
        }

    }

    Button
    {
        id: button4
        x: 365
        y: 229
        width: 130
        height: 46
        text: qsTr("Рекорды")
        font.pointSize: 11
        font.family: "Verdana"
        visible: true
        onClicked:
        {
            window.t_view = true;
            button.visible = false;
            button1.visible = false;
            button2.visible = false;
            button4.visible = false;
            button3.visible = false;
            window.b_view = true;
        }



    }



    Button {
        id: button3
        x: 365
        y: 331
        width: 130
        height: 46
        text: qsTr("Выход")
        autoRepeat: false
        font.family: "Tahoma"
        font.pointSize: 11
        visible:true
        onClicked:
        {
            dialog2.open()
        }
    }

    //===================================
    Button {
        id: button5
        x: 365
        y: 179
        width: 130
        height: 46
        text: qsTr("Легко")
        font.pointSize: 11
        font.family: "Tahoma"
        visible:false
        onClicked:            
        {

            //=============
            sound_game.play();
            //===============
            timer_progress_bar_pause1.start();
            timer_progress_bar_pause2.start();
            time.restart();
            animation_1.restart();
            anim2.restart_animation_2();
            anim3.restart_animation_3();
            anim5.restart_animation_5();
            //=========
            ballon1.visible = true;
            anim2.ballon_visible2(true);
            anim3.ballon_visible3(true);
            anim4.ballon_visible4(true)
            anim5.ballon_visible5(true);

                        //==================
                        button5.visible = false;
                        button6.visible = false;
                        button7.visible = false;
                        button8.visible = false;

                        cicrle1.visible = true;
                        cicrle2.visible = true;
                        cicrle3.visible = true;
                        cicrle4.visible = true;
                        cicrle5.visible = true;
                        //=================

                       //===================
                        image_small_heart.visible = true;
                        image_bomb.visible = true;
                        image_alarm.visible = true;
                        image_shield.visible = true;
                        image_slow.visible = true;
                        //=================

                       //===================
                        counter_1.visible = true; // отобразить счетчик
                        button.visible = false;   //
                        button1.visible = false;  // скрыть кнопки
                        button2.visible = false;  //
                        button3.visible = false;  //
                        button4.visible = false;
                        window.h_fone = false;    // скрыть стартовый фон
                        //===================
                        ballon1.visible = false;
                        anim2.ballon_visible2(false);
                        anim3.ballon_visible3(false);
                        anim4.ballon_visible4(false)
                        anim5.ballon_visible5(false);
                        //====================

                        //========================
                         image_play.source = "play.png"
                         image_play.visible = true
                        //================
                        image1.visible = false
                        //================
           healhthbar.source = "healthbar100.png";
           healhthbar.visible = true;
           text_total.visible = true;
                        //================
           _ballon.set_start_speed(6000.0,7000.0);
           _ballon.setter_for_interval(5000.0,10000.0);
           complexity = "easy";
           y_var[0] = true;
           y_var[1] = true;
           y_var[2] = true;
           animation_1.easing.type = Easing.Linear;
           anim2.use_linear_animation2();
           anim3.use_linear_animation3();
           anim4.use_linear_animation4();
           anim5.use_linear_animation5();
           cicrle1_mouse.enabled = true;
           cicrle2_mouse.enabled = true;
           cicrle3_mouse.enabled = true;
           cicrle4_mouse.enabled = true;
           cicrle5_mouse.enabled = true;
           second = 59;
           minute = 2;
           number_sky = 0;
           sky.source = "sky.jpg";
           progressBar3.value = 320;
           progressBar2.value = 80;
           progressBar1.value = 40;
           mouse.enabled = true
           anim2.mouse_enable2(true)
           anim3.mouse_enable3(true)
           anim4.mouse_enable4(true)
           anim5.mouse_enable5(true)
           time_r = true;
           opacity_logo = 0;
           timer_end.repeat = true;
           disable = true;
           //================
           counter_1.text = "0";
           _ballon.reset_score();
           _ballon.reset();
        }
    }


    Button {
        id: button6
        x: 365
        y: 229
        width: 130
        height: 46
        text: qsTr("Средне")
        font.pointSize: 11
        font.family: "Tahoma"
        visible:false
        onClicked: {

                       //=============
                       sound_game.play();
                       //===============
                       time.start(); //запуск нового таймера!
                      _ballon.set_start_speed(4500.0,6000.0);
                      _ballon.setter_for_interval(20000.0,30000.0);
                       complexity = "middle";
                      //==================================
                      timer_progress_bar_pause1.start();
                      timer_progress_bar_pause2.start();
                      y_var[0] = true;
                      y_var[1] = true;
                      y_var[2] = true;
                      animation_1.easing.type = Easing.Linear;
                      anim2.use_linear_animation2();
                      anim3.use_linear_animation3();
                      anim4.use_linear_animation4();
                      anim5.use_linear_animation5();
                      //====================================
                        button5.visible = false;
                        button6.visible = false;
                        button7.visible = false;
                        button8.visible = false;
                        //===============
                        cicrle1_mouse.enabled = true;
                        cicrle2_mouse.enabled = true;
                        cicrle3_mouse.enabled = true;
                        cicrle4_mouse.enabled = true;
                        cicrle5_mouse.enabled = true;
                        //============
                        number_sky = 0;        // возвращает фон в начальное положение
                        sky.source = "sky.jpg";
                        //==============
                        progressBar3.value = 320;
                        progressBar2.value = 80;
                        progressBar1.value = 40;
                        //=================                 
                        time.restart();
                        second = 59;
                        minute = 2;
                       //====================
                        cicrle1.visible = true;
                        cicrle2.visible = true;
                        cicrle3.visible = true;
                        cicrle4.visible = true;
                        cicrle5.visible = true;
                        //=================
                       image_small_heart.visible = true;
                       image_bomb.visible = true;
                       image_alarm.visible = true;
                       image_shield.visible = true;
                       image_slow.visible = true;
                        //=================
                        animation_1.restart()      // запустить анимацию
                        anim2.restart_animation_2()
                        anim3.restart_animation_3()

                        anim5.restart_animation_5()
                        counter_1.visible = true; // отобразить счетчик
                        button.visible = false;   //
                        button1.visible = false;  // скрыть кнопки
                        button2.visible = false;  //
                        button3.visible = false;  //
                        button4.visible = false;
                        window.h_fone = false;    // скрыть стартовый фон
                        //===================
                        ballon1.visible = true;
                        anim2.ballon_visible2(true);
                        anim3.ballon_visible3(true);
                        anim4.ballon_visible4(true)
                        anim5.ballon_visible5(true);
                        //====================
                        mouse.enabled = true  // включить мышь для всех динамических обьектов
                        anim2.mouse_enable2(true)
                        anim3.mouse_enable3(true)
                        anim4.mouse_enable4(true)
                        anim5.mouse_enable5(true)
                        //========================
                         image_play.source = "play.png"
                         image_play.visible = true
                        //================
                        image1.visible = false
                        //================
                        healhthbar.source = "healthbar100.png";
                        healhthbar.visible = true;
                        text_total.visible = true;
                        //================
                        time_r = true;
                         opacity_logo = 0;
                        timer_end.repeat = true;
                        disable = true;
                        //================
                        counter_1.text = "0";
                        _ballon.reset_score();
                        _ballon.reset();
        }
    }
    Button {
        id: button7
        x: 365
        y: 280
        width: 130
        height: 46
        text: qsTr("Сложно")
        autoRepeat: true
        font.pointSize: 11
        font.family: "Tahoma"
        visible:false
        onClicked: {

                         //=============
                         sound_game.play();
                         //===============
                         time.start(); //запуск нового таймера!
                        _ballon.set_start_speed(3500.0,4500.0);
                        _ballon.setter_for_interval(40000.0,50000.0);
                        complexity = "hard";
                         //================
                         timer_progress_bar_pause1.start();
                         timer_progress_bar_pause2.start();                   
                         y_var[0] = true;
                         y_var[1] = true;
                         y_var[2] = true;
                         animation_1.easing.type = Easing.Linear;
                         anim2.use_linear_animation2();
                         anim3.use_linear_animation3();
                         anim4.use_linear_animation4();
                         anim5.use_linear_animation5();
                        //=================
                        button5.visible = false;
                        button6.visible = false;
                        button7.visible = false;
                        button8.visible = false;
                        //===============
                        cicrle1_mouse.enabled = true;
                        cicrle2_mouse.enabled = true;
                        cicrle3_mouse.enabled = true;
                        cicrle4_mouse.enabled = true;
                        cicrle5_mouse.enabled = true;
                        //============
                        number_sky = 0;        // возвращает фон в начальное положение
                        sky.source = "sky.jpg";
                        //==============                 
                        time.restart();
                        second = 59;
                        minute = 2;
                       //====================
                       progressBar3.value = 320;
                       progressBar2.value = 80;
                       progressBar1.value = 40;
                      //====================
                        cicrle1.visible = true;
                        cicrle2.visible = true;
                        cicrle3.visible = true;
                        cicrle4.visible = true;
                        cicrle5.visible = true;
                        //=================
                        image_small_heart.visible = true;
                        image_bomb.visible = true;
                        image_alarm.visible = true;
                        image_shield.visible = true;
                        image_slow.visible = true;
                        //=================
                        animation_1.restart()      // запустить анимацию
                        anim2.restart_animation_2()
                        anim3.restart_animation_3()                      
                        anim5.restart_animation_5()
                        //=========
                        counter_1.visible = true; // отобразить счетчик
                        button.visible = false;   //
                        button1.visible = false;  // скрыть кнопки
                        button2.visible = false;  //
                        button3.visible = false;  //
                        button4.visible = false;
                        window.h_fone = false;    // скрыть стартовый фон
                        //===================
                        ballon1.visible = true;  // скрыть шарики
                        anim2.ballon_visible2(true);
                        anim3.ballon_visible3(true);
                        anim4.ballon_visible4(true)
                        anim5.ballon_visible5(true);
                        //====================
                        mouse.enabled = true  // включить мышь для всех динамических обьектов
                        anim2.mouse_enable2(true)
                        anim3.mouse_enable3(true)
                        anim4.mouse_enable4(true)
                        anim5.mouse_enable5(true)
                        //========================
                         image_play.source = "play.png"
                         image_play.visible = true
                        //================
                        image1.visible = false
                        //================
                        healhthbar.source = "healthbar100.png";
                        healhthbar.visible = true;
                        text_total.visible = true;
                        //================
                        time_r = true;
                         opacity_logo = 0;
                        timer_end.repeat = true;
                        disable = true;
                        //================
                        counter_1.text = "0";
                        _ballon.reset_score();
                        _ballon.reset();

        }
    }

    Button {
        id: button8
        x: 365
        y: 330
        width: 130
        height: 46
        text: qsTr("Вернуться")
        font.pointSize: 11
        font.family: "Tahoma"
        visible:false
        onClicked:
        {
            button5.visible = false;
            button6.visible = false;
            button7.visible = false;
            button8.visible = false;
            button.visible = true;
            button1.visible = true;
            button3.visible = true;
            button4.visible = true;
        }
    }
    //===================================
    Dialog
    {
        anchors.centerIn:parent
        id: dialog2
        title: "Выйти?"
        standardButtons: Dialog.Ok | Dialog.Cancel
        onAccepted:
        {
            Qt.quit()
        }

        onRejected: {
         /*   textEdit.visible = true;
            accept.visible = true;
            rectangle1.visible = true;
            image_nameinput.visible = true;

         button.visible = false;
         button1.visible = false;
         button3.visible = false;
         button4.visible = false;*/

        }
    }


    Button {
        id: button2
        x: 364
        y: 384
        width: 130
        height: 46
        text: qsTr("Продолжить")
        autoRepeat: false
        font.pointSize: 11
        font.family: "Verdana"
        visible: false
        onClicked:
        {   cicrle1.visible = true;
            cicrle2.visible = true;
            cicrle3.visible = true;
            cicrle4.visible = true;
            cicrle5.visible = true;
            //====================     
            if(progressBar1.value >=0 && progressBar1.value <40)
            {
             animation_1.pause();
             anim2.pause_animation_2();
             anim3.pause_animation_3();
             anim4.pause_animation_4();
             anim5.pause_animation_5();
             //=============
             anim4.tmr_stop();
            }

            else{
                animation_1.resume()
                          anim2.resume_animation_2()
                        anim3.resume_animation_3()
                       anim4.resume_animation_4()
                         anim5.resume_animation_5()
                   //============
                         anim4.tmr_start();
            }


            //======================
            ballon1.visible = true;  // отобразить шарики
            anim2.ballon_visible2(true);
            anim3.ballon_visible3(true);
            anim4.ballon_visible4(true);
            anim5.ballon_visible5(true);
            counter_1.visible = true; // отобразить текст    
            //========================
            if(progressBar2.value >=0 && progressBar2.value <80)
           {   progressBar2.visible = true;
                timer_progress_bar2.start();
                if(shield_image_emblem.visible == false) {shield_image_emblem.visible = true;image_shield.visible = true; }
            }

            if(progressBar1.value >=0 && progressBar1.value <40)
            {   anim4.tmr_stop();
                progressBar1.visible = true;
                timer_progress_bar1.start();
                if(alarm_image_emblem.visible == false) { alarm_image_emblem.visible = true;image_alarm.visible = true; }
            }

            if(progressBar3.value >0 && progressBar3.value < 320)
            {
                progressBar3.visible = true;
                timer_progress_bar3.start();
                if(slow_image_emblem.visible == false) {slow_image_emblem.visible = true; image_slow.visible = true;}
            }

            //=========================
            window.h_fone = false; // скрыть фон
            //========================
            button.visible = false;
            button1.visible = false;// скрыть кнопки
            button2.visible = false;
            button3.visible = false;
            button4.visible = false;
            image_play.source = "play.png"
            //==========================
            mouse.enabled = true  // включить мышь для всех динамических обьектов
            anim2.mouse_enable2(true)
            anim3.mouse_enable3(true)
            anim4.mouse_enable4(true)
            anim5.mouse_enable5(true)
            //===========================
            healhthbar.visible = true;
            text_total.visible = true;
            //===========================
            time.start();
        }
    }



    Text                               // счетчик взрывов
    {
        objectName: "counter_1"
        visible:false
        id: counter_1
        x: 155
        y: 21
        color:"#47f38e"
        styleColor: "black"
        style:Text.Outline
        text: "0"
        font.bold: true
        font.pixelSize: 32
    }

    Text {
        id: text_total
        text: qsTr("SCORE:")
        font.bold: true
        font.pixelSize: 32
        color: "#f40d18"
        style: Text.Outline;
        styleColor: "black"
        visible:false
        x: 19
        y: 21
    }

    Timer
    {
      id:timer_progress_bar3
      interval:62
      running:false
      repeat:true
      onTriggered:          
      {   slow_image_emblem.visible = true;
          progressBar3.visible = true;
          progressBar3.value--;
          if(progressBar3.value == 0)
          {
              y_var[save_number3]=true; // освобождаем ячейку
              timer_progress_bar3.stop();
              timer_progress_bar_pause3.start();
          }


      }
    }

       Timer
          {
             id:timer_progress_bar_pause3
             interval: 1000
             running:false
             onTriggered:
             {      slow_image_emblem.visible = false;

                    animation_1.easing.type = Easing.Linear;
                    anim2.use_linear_animation2();
                    anim3.use_linear_animation3();
                    anim4.use_linear_animation4();
                    anim5.use_linear_animation5();

                    progressBar3.visible = false;
                    progressBar3.value = 320;                    
             }

          }

       Timer
       {
         id:timer_progress_bar2
         interval:125
         running:false
         repeat:true
         onTriggered:
         {
             shield_image_emblem.visible = true;
             progressBar2.visible = true;
             progressBar2.value--;
             if(progressBar2.value == 0)
             {   y_var[save_number2]=true; // освобождаем ячейку                 
                 timer_progress_bar2.stop();
                 timer_progress_bar_pause2.start();                
             }

         }
       }

       Timer
          {
             id:timer_progress_bar_pause2
             interval: 1000
             running:false
             onTriggered:
             {      blink_ballon1.stop();
                    blink_effect = true;
                    ballon1.visible = true;
                    anim2.stop_func_blink2();
                    anim3.stop_func_blink3();
                    anim5.stop_func_blink5();
                 //===================
                    shield_image_emblem.visible = false;
                    progressBar2.visible = false;
                    progressBar2.value = 80;

             }

          }

       Timer
       {
         id:timer_progress_bar1
         interval:125
         running:false
         repeat:true
         onTriggered:            
         {
             alarm_image_emblem.visible = true;
             progressBar1.visible = true;
             progressBar1.value--;
             if(progressBar1.value == 0)
             {   time.start();
                 y_var[save_number1]=true; // освобождаем ячейку                 
                 //==========
                 timer_progress_bar1.stop();
                 timer_progress_bar_pause1.start();
             }

         }
       }

       Timer
          {
             id:timer_progress_bar_pause1
             interval: 125
             running:false
             onTriggered:
             {
                 //==================
                 anim4.tmr_start();
                 //============
                 animation_1.resume();
                 anim2.resume_animation_2();
                 anim3.resume_animation_3();
                 anim4.resume_animation_4();
                 anim5.resume_animation_5();
                 //==================
                    alarm_image_emblem.visible = false;
                    progressBar1.visible = false;
                    progressBar1.value = 40;                                                   //прогресс бар 1 - будильник
             }

          }
    //======================

    Timer           // таймер конечного отображения логотипа GAME_OVER
    {
        id:timer_end
        interval: 100
        running: false
        repeat: true
        onTriggered:
        {

            opacity_logo +=0.1;
            image1.opacity = opacity_logo;

            if(opacity_logo >0.7)
            {
                ballon1.visible = false;
                anim2.ballon_visible2(false);
                anim3.ballon_visible3(false);
                anim4.ballon_visible4(false)
                anim5.ballon_visible5(false);
                //================
                timer_end.repeat = false;
                disable = false;           
                time.stop();
                //=============
                textEdit.visible = true;
                accept.visible = true;
                rectangle1.visible = true;
                image1.visible = false;
                //=============


               //===============
            }
        }

    }

    Timer                      // таймер постепенного затухания lvl_up
    {
        id:timer_up
        interval: 100
        repeat: true
        onTriggered:
        {
            opacity_up -=0.1;
            image3.opacity = opacity_up;
            image4.opacity = opacity_up;
            if(opacity_up <0)
            {
                timer_up.repeat = false;
                second = 59;
                minute = 2;
                time.restart();
                //==========
                  animation_1.restart();
                  anim2.restart_animation_2();
                  anim3.restart_animation_3();
                  anim4.restart_animation_4();
                  anim5.restart_animation_5();
                //========
                strt = true;
                //========
                mouse.enabled = true;
                anim2.mouse_enable2(true);
                anim3.mouse_enable3(true);
                anim4.mouse_enable4(true);
                anim5.mouse_enable5(true);
               //=======================
               airballons.start_animation_5();
                //==================
                 animation_1.duration = 5000;
                 anim2.set_duration_animation_2(5000);
                 anim3.set_duration_animation_3(5000);
                 anim5.set_duration_animation_5(5000);

                }
            }
    }

    Timer                      // таймер постепенного появления lvl_up
    {
        id:timer_up_2
        interval: 100
        repeat: true
        onTriggered:
        {
            opacity_up +=0.1;
            image3.opacity = opacity_up;
            image4.opacity = opacity_up;
            if(opacity_up > 1)
            {
                timer_up_2.stop();
                timer_lvlup.start();
                timer_lvlup.repeat = true;
            }
        }
    }


Timer               // таймер выдержки полтора-секундной паузы перед затуханием логотипа
{
    id:timer_pause
    interval:1500
    onTriggered:
    {
        timer_up.start();
        timer_up.repeat = true;
    }

}

    Timer                   // таймер отключения мигания логотипа
    {
        id:timer_end_lvl_up
        interval:3000
        running:false
        repeat:false
        onTriggered:
        {
            timer_lvlup.repeat = false;
            timer_pause.start();
        }

    }

    Timer{

        id:change_fone
        interval:7000
        running:false
        repeat: false
        onTriggered:
        {
            minute = 2;
            second = 59;
            healhthbar.source = "healthbar100.png";
            //===============
            cicrle1_mouse.enabled = true;
            cicrle2_mouse.enabled = true;
            cicrle3_mouse.enabled = true;
            cicrle4_mouse.enabled = true;
            cicrle5_mouse.enabled = true;
            //================
            _ballon.reset();
            if(number_sky < 4)
            {
             number_sky ++;
             sky.source = _ballon.func_sky(number_sky);

            }
            else {
            number_sky = 0;
            sky.source = _ballon.func_sky(number_sky);
            }
        }

    }

   Timer                // таймер мигающего логотипа lvl_up
   {
       id:timer_lvlup
       interval:500
       running:false
       repeat:true
       onTriggered:
       {
             if(strt)       // запускает разовый отсчет
             {
                 timer_end_lvl_up.running = true;
                 strt = false;
             }
                      if(lvlup) {
                           image4.visible = false;
                           lvlup = false;
                       }
                       else
                       {
                           image4.visible = true;
                           lvlup = true;
                       }
       }
   }

   Rectangle {
       id: rectangle3
       x: 359
       y: 246
       width: 141
       height: 111
       color: "#adfdb3"
       visible: false
       border.color: "#3b3ef3"
   }
   Rectangle {
       id: rectangle2
       x: 174
       y: 156
       width: 504
       height: 87
       color: "#adfdb3"
       radius:2.5
       border.color: "#3b3ef3"
       visible: false
   }


   Rectangle {
       id: rectangle1
       x: 371
       y: 263
       width: 120
       height: 37
       color: "#ffffff"
       visible: false
   }




   Image {
       id: image_nameinput
       x: 146
       y: 163
       width: 545
       height: 80
       fillMode: Image.PreserveAspectFit
       source: "nameinput.png"
       visible:false
   }



   TextInput {
       id: textEdit
       x: 370
       y: 262
       width: 120
       height: 37
       font.pixelSize: 21
       visible: false
       maximumLength:9
   }


   Button {
       id: accept
       x: 371
       y: 311
       width: 120
       height: 40
       text: qsTr("Подтвердить")
       visible: false
       font.pixelSize:16
       onClicked:
       {
           textEdit.visible = false;
           accept.visible = false;
           rectangle1.visible = false;
           rectangle2.visible = false;
           rectangle3.visible = false;
           image_nameinput.visible = false;
           //=================
           dialog.open();
       }
   }





}




































































