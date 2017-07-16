#include <iostream>
#include <list>
#include <string>

using namespace std;

class Viewer_interface{
public:
    virtual void view(const string& news) = 0;
    virtual const string& name() = 0;
};

class Viewer : public Viewer_interface{
public:
    Viewer(const string& name) : mName(name) {}

    void view(const string& news) override { cout << mName << " : " << news << endl; }
    const string& name() {return mName; }

private:
    string mName;
};

class Station_interface {
public:
    void registerObserver(Viewer_interface* o) { mList.insert(mList.end(),o); cout << "register Observer : " << o->name() << endl; } 
    void unregisterObserver(Viewer_interface* o) {mList.remove(o); cout << "unregister Observer : " << o->name() << endl; } 

    virtual void news(const string& news) = 0;

protected:
    void send(const string& news){
	for(const auto& i : mList){
	    i->view(news);
	}
    }

private:
    list<Viewer_interface*> mList;
};

class DongHoTV : public Station_interface{
public:
    void news(const string& news) override { send(news); }
};

int main(){
    Station_interface* pSubject = new DongHoTV;

    Viewer_interface* pObserver1 = new Viewer("Anderson");
    Viewer_interface* pObserver2 = new Viewer("Benjamin");
    Viewer_interface* pObserver3 = new Viewer("Charlie");

    pSubject->registerObserver(pObserver1);
    pSubject->registerObserver(pObserver2);
    pSubject->registerObserver(pObserver3);

    pSubject->news("Hello everyone? ");

    pSubject->unregisterObserver(pObserver2);
    pSubject->unregisterObserver(pObserver1);

    pSubject->news("Break news!!! ");

    delete pSubject;
    delete pObserver1;
    delete pObserver2;
    delete pObserver3;

    return EXIT_SUCCESS;
}
