#ifndef BALLON_H
#define BALLON_H

#include <QObject>
#include <chrono>
#include <QtSql/QSqlError>
#include <QtSql/qsqlquery.h>
#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlRecord>

class ballon : public QObject
{
    QString source[8]={"ballon1.png","ballon2.png","ballon3.png","ballon4.png","ballon5.png","ballon6.png","ballon7.png","ballon8.png"};
    QString health_bar[11] ={"healthbar0.png","healthbar10.png","healthbar20.png","healthbar30.png","healthbar40.png","healthbar50.png","healthbar60.png","healthbar70.png","healthbar80.png","healthbar90.png","healthbar100.png"};
    QString effects[5] ={"heart.png","clocks1.png","bomb.png","shield.png","slow.png"};
    QString arrow_position[12] ={"clocks1.png","clocks2.png","clocks3.png","clocks4.png","clocks5.png","clocks6.png","clocks7.png","clocks8.png","clocks9.png","clocks10.png","clocks11.png","clocks12.png"};
    QString sky[5]={"sky.jpg","sky2.jpg","sky3.jpg","sky4.jpg","sky5.jpg"};    
    Q_OBJECT
public:
    explicit ballon(QObject *parent = nullptr);

    Q_INVOKABLE void counter(int);
    Q_INVOKABLE void counter1(int);
    Q_INVOKABLE void counter2(int);
    Q_INVOKABLE void counter3(int);
    //==================
    Q_INVOKABLE int rand_Y();
    Q_INVOKABLE int rand_X();
    //==================
    Q_INVOKABLE void up();
    Q_INVOKABLE void down();
    Q_INVOKABLE void reset();
    Q_INVOKABLE int current_index();
    //===================
    Q_INVOKABLE void reset_score();
    //===================
    double parametrA;
    double parametrB;
  //=====================
    int value;
    int index;
    int a;
    int spd;
    int size_ballon;
    double logo;
    QSqlDatabase db;
signals:

public slots:
   void setter_for_interval(double a, double b);
    double function_rand(double a, double b);
   int interval();
   QString source_images();
   QString source_healhthbar();
   QString source_effect();
   QString arrow_of_clock(int);
   QString func_sky(int);
   void set_start_speed(double,double);
   int time_interval();
   int get_ballon4_x_pos();
   int get_ballon4_y_pos();
protected:
   QObject* view;
};

#endif // BALLON_H
