import datetime
from random import randint
from tkinter import *
from Connection import getConn


isLogged = False
win = Tk()
win.title("Alibaba")
pad = 3
win.geometry("{0}x{1}+0+0".format(
            win.winfo_screenwidth()-pad, win.winfo_screenheight()-pad))
global frame
frame = Frame(win)
frame.pack(side="top", expand=True, fill="both")
f = Frame(win)
f.pack(side="top", expand=True, fill="both")
global conn
conn = getConn()

def profile():
    pass
def overseas():
    clearf()
    yy = 30
    xx = 28
    conn.execute("select fromCountry, toCountry, fromCity, toCity, company, price, fromDate from overseaFlight")
    ino = conn.fetchall()
    Label(f,width=20, height=1, text="From country" , bg="orange").place(x=28,y=0)
    Label(f,width=20, height=1, text="To country", bg="orange").place(x=178,y=0)
    Label(f,width=20, height=1, text="From city" , bg="orange").place(x=328,y=0)
    Label(f,width=20, height=1, text="To city" , bg="orange").place(x=478,y=0)
    Label(f,width=20, height=1, text="Company" , bg="orange").place(x=628,y=0)
    Label(f,width=20, height=1, text="Price" , bg="orange").place(x=778,y=0)
    Label(f,width=20, height=1, text="Date" , bg="orange").place(x=928,y=0)
    for i in range(len(ino)):
        for j in range(len(ino[0])):
            e = Entry(f, width=24, fg='blue')
            e.place(x = xx + j*150, y = yy + i*30)
            e.insert(END, ino[i][j])
def bus():
    clearf()
    yy = 30
    xx = 28
    conn.execute("select fromCity, toCity, company, price, fromDate from buses")
    ino = conn.fetchall()
    Label(f,width=20, height=1, text="From" , bg="orange").place(x=28,y=0)
    Label(f,width=20, height=1, text="To", bg="orange").place(x=178,y=0)
    Label(f,width=20, height=1, text="Company" , bg="orange").place(x=328,y=0)
    Label(f,width=20, height=1, text="Price" , bg="orange").place(x=478,y=0)
    Label(f,width=20, height=1, text="Date" , bg="orange").place(x=628,y=0)
    for i in range(len(ino)):
        for j in range(len(ino[0])):
            e = Entry(f, width=24, fg='blue')
            e.place(x = xx + j*150, y = yy + i*30)
            e.insert(END, ino[i][j])
def hotel():
    pass

def logged_in():
    global name
    conn.execute("select first_name, last_name from _user where id =" + str(idm))
    i = conn.fetchall()
    name = i[0][0] + " " + i[0][1]
    clear_frame()
    clearf()
    Label(frame,width="218", height=2, text="Welcome! " + name, bg="orange").pack()
    Button(frame, text="Domestic Flights", width=50, height=1, bg="orange",command=domestic).place(x=28,y=60)
    Button(frame, text="Oversea Flights", width=50, height=1, bg="orange",command=overseas).place(x=398,y=60)
    Button(frame, text="Bus", width=50, height=1, bg="orange",command=bus).place(x=768,y=60)
    Button(frame, text="Hotel", width=50, height=1, bg="orange",command=hotel).place(x=1138,y=60)
    Button(f, text="Edit", width=10, height=1, bg="orange",command=profile).place(x=1400,y=200)
    Button(f, text="Logout", width=10, height=1, bg="orange",command=main_page).place(x=1400,y=250)

def domestic():
    clearf()
    yy = 30
    xx = 28
    conn.execute("select fromCity, toCity, company, price, fromDate from domesticFlights")
    ino = conn.fetchall()
    Label(f,width=20, height=1, text="From" , bg="orange").place(x=28,y=0)
    Label(f,width=20, height=1, text="To", bg="orange").place(x=178,y=0)
    Label(f,width=20, height=1, text="Company" , bg="orange").place(x=328,y=0)
    Label(f,width=20, height=1, text="Price" , bg="orange").place(x=478,y=0)
    Label(f,width=20, height=1, text="Date" , bg="orange").place(x=628,y=0)
    for i in range(len(ino)):
        for j in range(len(ino[0])):
            e = Entry(f, width=24, fg='blue')
            e.place(x = xx + j*150, y = yy + i*30)
            e.insert(END, ino[i][j])
def Login():
    global idm
    uname=username.get()
    pwd=password.get()
    if uname=='' or pwd=='':
        message.set("fill the empty field!!!")
    else:
        try:
            int(uname)
            conn.execute("select _password, id from _user where MobileNumber ='" + uname + "'")
            i = conn.fetchall()
            if i[0][0] == pwd :
                idm = i[0][1]
                logged_in()
            else:
                conn.execute("select count(1) from _user where MobileNumber ='" + uname + "'")
                i = conn.fetchall()
                if len(i) == 0:
                    message.set("There is no account with this mobile number")
                else:
                    message.set("Wrong username or password!!!")
        except:
            conn.execute("select _password, id from _user where email ='" + uname + "'")
            i = conn.fetchall()
            if i[0][0] == pwd :
                idm = i[0][1]
                logged_in()
            else:
                conn.execute("select count(1) from _user where email ='" + uname + "'")
                i = conn.fetchall()
                if len(i) == 0:
                    message.set("There is no account with this email")
                else:
                    message.set("Wrong username or password!!!")

def clear_frame():
   for widgets in frame.winfo_children():
      widgets.destroy()

def clearf():
    for widgets in f.winfo_children():
        widgets.destroy()

def add_user():
    global idm
    try:
        conn.execute("insert into _user (MobileNumber, first_name, last_name, _password, registration_date) values ('" + mobile.get() +"','" + fname.get()+"','" + lname.get() + "','" + pd.get() + "','" + str(datetime.datetime.now().date()) + "')")
        c.destroy()
        conn.commit()
        conn.execute("select id from _user where MobileNumber ='" + mobile.get() + "'")
        i = conn.fetchall()
        idm = i[0][0]
        Button(frame, text="Start", width=10, height=1, bg="orange",command=logged_in).place(x=105,y=162)
        Label(frame, text="Account created succesfully").place(x=95,y=142)
    except:
        Label(frame, text="Failed").place(x=95,y=142)

        

def check():
    global fname
    global lname
    global pd
    global c
    fname = StringVar()
    lname = StringVar()
    pd = StringVar()
    if int(code.get()) == num:
        clear_frame()
        clearf()
        Label(frame,width="218", height=2, text="Please enter details below to create a new account", bg="orange").pack()
        Label(frame, text="First name * ").place(x=20,y=40)
        Entry(frame, textvariable=fname, width=50).place(x=90,y=42)
        Label(frame, text="Last name * ").place(x=20,y=80)
        Entry(frame, textvariable=lname ,width=50).place(x=90,y=82)
        Label(frame, text="Password * ").place(x=20,y=120)
        Entry(frame, textvariable=pd ,width=50).place(x=90,y=122)
        c = Button(frame, text="Create", width=10, height=1, bg="orange",command=add_user)
        c.place(x=105,y=162)
    else:
        top= Toplevel(win)
        top.geometry("250x250")
        top.title("Error")
        Label(top, text= "Wrong code" + "\n"+ "Try again!").place(x=45,y=80)
        new_account()

    


def send_code():
    global num
    global code
    code = StringVar()
    if len(mobile.get()) == 11 and mobile.get()[:2] == "09":
        conn.execute("select count(1) from _user where MobileNumber ='" + mobile.get() + "'")
        i = conn.fetchall()
        if i[0][0] == 0:
            top= Toplevel(win)
            top.geometry("250x250")
            top.title("Your Code")
            num = randint(1000,10000)
            Label(top, text= "Your code is "+str(num)).place(x=45,y=80)
            Label(frame, text="Code * ").place(x=20,y=80)
            Entry(frame, textvariable=code).place(x=200,y=82)
            sdc.destroy()
            Button(frame, text="Check", width=10, height=1, bg="orange",command=check).place(x=105,y=130)
        else:
            top= Toplevel(win)
            top.geometry("250x250")
            top.title("Your Code")
            num = randint(1000,10000)
            Label(top, text= "Phone number already exists").place(x=45,y=80)
            load_login()
    else:
        message.set("Please enter a valid number!")
        

def new_account():
    global mobile
    global sdc
    clear_frame()
    clearf()
    Label(frame,width="218", height=2, text="Please enter your mobile number", bg="orange").pack()
    mobile = StringVar()
    message=StringVar()
    Label(frame, text="Mobile number * ").place(x=20,y=40)
    Entry(frame, textvariable=mobile, width=50).place(x=200,y=42)
    Label(frame, text="",textvariable=message).place(x=95,y=100)
    Button(frame, text="Go back", width=10, height=1, bg="orange",command=main_page).place(x=1400,y=40)
    sdc = Button(frame, text="Send code", width=10, height=1, bg="orange",command=send_code)
    sdc.place(x=105,y=130)

def load_login():
    global message
    global username
    global password
    clear_frame()
    clearf()
    Label(frame,width="218", height=2, text="Please enter details below to login", bg="orange").pack()
    username = StringVar()
    password = StringVar()
    message=StringVar()
    Label(frame, text="Username * ").place(x=20,y=40)
    Entry(frame, textvariable=username, width=50).place(x=90,y=42)
    Label(frame, text="Password * ").place(x=20,y=80)
    Entry(frame, textvariable=password ,show="*").place(x=90,y=82)
    Label(frame, text="",textvariable=message).place(x=95,y=100)
    Button(frame, text="Login", width=10, height=1, bg="orange",command=Login).place(x=105,y=130)
    Button(frame, text="Go back", width=10, height=1, bg="orange",command=main_page).place(x=1400,y=40)

def main_page():
    clear_frame()
    clearf()
    global login
    global account
    login = Button(frame, text="Login", width=218, height=2, bg="orange",command=load_login)
    login.place(x=0,y=0)
    account = Button(frame, text="Create new account", width=218, height=2, bg="orange",command=new_account)
    account.place(x=0,y=60)
    Button(frame, text="Domestic Flights", width=50, height=1, bg="orange",command=domestic).place(x=28,y=120)
    Button(frame, text="Oversea Flights", width=50, height=1, bg="orange",command=overseas).place(x=398,y=120)
    Button(frame, text="Bus", width=50, height=1, bg="orange",command=bus).place(x=768,y=120)
    Button(frame, text="Hotel", width=50, height=1, bg="orange",command=hotel).place(x=1138,y=120)

    win.mainloop()


main_page()
