#include "ballon.h"
#include <QObject>
#include <QVariant>
#include <QDebug>
#include <QTimer>
#include <QThread>
#include <QString>
#include "random.h"
#include "random"

ballon::ballon(QObject *parent) : view(parent)
{
 a=0;
 index = 10;
 logo = 0;
 parametrA = 30000.0;
 parametrB = 40000.0;

}


double ballon::function_rand(double a,double b)
{
    std::random_device randD;
    std::mt19937 mt(randD());
    std::uniform_real_distribution<double> dist_(a, b);
    return (int)dist_(mt);
}

QString ballon::source_effect()
{
    return effects[(int)function_rand(0.0,5.0)];
}

QString ballon::source_images()
{
    return source[(int)function_rand(0.0,8.0)];

}

QString ballon::arrow_of_clock(int value)
{
    return arrow_position[value];
}

QString ballon::func_sky(int value)
{
    return sky[value];
}

QString ballon::source_healhthbar()
{

if(index == 0)
{

        QObject* img_gv = view->findChild<QObject*>("img_game_over");
        img_gv->setProperty("visible",true);
        img_gv->setProperty("opacity",0);
        //==========================
        QObject* anim1_stopped = view->findChild<QObject*>("animation_1");
        anim1_stopped->setProperty("running",false);

        //==========================
        QObject* anim2_stopped = view->findChild<QObject*>("animation_2");
        anim2_stopped->setProperty("running",false);

        //==========================
        QObject* anim3_stopped = view->findChild<QObject*>("animation_3");
        anim3_stopped->setProperty("running",false);

        //=========================
        QObject* anim4_stopped = view->findChild<QObject*>("animation_4");
        anim4_stopped->setProperty("running",false);

        //=========================

        QObject* img1 = view->findChild<QObject*>("ballon1");
        img1->setProperty("visible",false);
        //==========================
        QObject* img2= view->findChild<QObject*>("ballon2");
        img2->setProperty("visible",false);
        //==========================
        QObject* img3 = view->findChild<QObject*>("ballon3");
        img3->setProperty("visible",false);
        //=========================
        QObject* img4 = view->findChild<QObject*>("ballon4");
        img4->setProperty("visible",false);
        //=========================


}

if(index <=10 && index >= 0)
{
    return health_bar[index];
}

      return health_bar[0];
}

void ballon::down(){index--;};
void ballon::up()  {

    index+=5;
    if(index >=10){ index =10;}
                   }
void ballon::reset(){index = 10;};
void ballon::reset_score(){a = 0;};

int ballon::current_index(){ return index;};





void ballon::set_start_speed(double a, double b)
{
    QObject* set_speed_a1 = view->findChild<QObject*>("animation_1");
    set_speed_a1->setProperty("duration",(int)function_rand(a,b));

    QObject* set_speed_a2 = view->findChild<QObject*>("animation_2");
    set_speed_a2->setProperty("duration",(int)function_rand(a,b));

    QObject* set_speed_a3 = view->findChild<QObject*>("animation_3");
    set_speed_a3->setProperty("duration",(int)function_rand(a,b));

    QObject* set_speed_a5 = view->findChild<QObject*>("animation_5");
    set_speed_a5->setProperty("duration",(int)function_rand(a,b));
}

int ballon::time_interval()
{
    QObject* interval = view->findChild<QObject*>("timer_1");
    interval->setProperty("interval",spd);
    return spd;
}

int ballon::get_ballon4_x_pos()
{
    QObject* x = view->findChild<QObject*>("ballon4");
    return x->property("x").toInt();
}

int ballon::get_ballon4_y_pos()
{
    QObject* y = view->findChild<QObject*>("ballon4");
    return y->property("y").toInt();
}

void ballon::counter(int value)
{
    QObject* count = view->findChild<QObject*>("counter_1");
    a+=value;
    count->setProperty("text",QString::number(a));
}

void ballon::counter1(int value)
{
    QObject* count = view->findChild<QObject*>("counter_1");  
    a += value;
    count->setProperty("text",QString::number(a));
}

void ballon::counter2(int value)
{
    QObject* count = view->findChild<QObject*>("counter_1");
    a += value;
    count->setProperty("text",QString::number(a));
}

void ballon::counter3(int value)
{
    QObject* count = view->findChild<QObject*>("counter_1");
    a += value;
    count->setProperty("text",QString::number(a));
}


int ballon::interval()
{  
    int r = (int)function_rand(parametrA,parametrB);
    return r;
}

void ballon::setter_for_interval(double a, double b)
{
    parametrA = a;
    parametrB = b;
}

int ballon::rand_X()
{   
    int X = (int)function_rand(0.0,700.0);
    return X;
}

int ballon::rand_Y()
{ 
    int Y = (int)function_rand(300.0,900.0);
    return Y;
}

//==============


