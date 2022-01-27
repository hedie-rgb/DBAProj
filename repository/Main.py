from tkinter import *
from unicodedata import name
from Connection import getConn

# def profile():
#     global name
#     global lastname
#     global 
# def domestic():
# def overseas():
# def bus():
# def hotel():

def clear_frame():
   for widgets in frame.winfo_children():
      widgets.destroy()
def load_menu():
    Button(frame, text="Profile", width=10, height=1, bg="orange",command=profile).place(x=105,y=130)
    Button(frame, text="Domestic Flights", width=10, height=1, bg="orange",command=domestic).place(x=105,y=180)
    Button(frame, text="Oversea Flights", width=10, height=1, bg="orange",command=overseas).place(x=105,y=230)
    Button(frame, text="Bus", width=10, height=1, bg="orange",command=bus).place(x=105,y=230)
    Button(frame, text="Hotel", width=10, height=1, bg="orange",command=hotel).place(x=105,y=280)
#defining login function
def login():
    #getting form data
    uname=username.get()
    pwd=password.get()
    #applying empty validation
    if uname=='' or pwd=='':
        message.set("fill the empty field!!!")
    else:
        c = getConn()
        try:
            int(uname)
            c.execute("select _password from _user where MobileNumber ='" + uname + "'")
            i = c.fetchall()
            if i[0][0] == pwd :
                clear_frame()
            else:
                message.set("Wrong username or password!!!")
        except:
            c.execute("select _password from _user where email ='" + uname + "'")
            i = c.fetchall()
            if i[0][0] == pwd :
                clear_frame()
            else:
                message.set("Wrong username or password!!!")
#defining loginform function
def Loginform():
    global win
    win = Tk()
    #Setting title of screen
    win.title("Login Form")
    #setting height and width of screen
    win.geometry("800x600")
    global frame
    frame = Frame(win)
    frame.pack(side="top", expand=True, fill="both")
    #declaring variable
    global  message
    global username
    global password
    username = StringVar()
    password = StringVar()
    message=StringVar()
    #Creating layout of login form
    Label(frame,width="300", text="Please enter details below", bg="orange",fg="white").pack()
    #Username Label
    Label(frame, text="Username * ").place(x=20,y=40)
    #Username textbox
    Entry(frame, textvariable=username, width=50).place(x=90,y=42)
    #Password Label
    Label(frame, text="Password * ").place(x=20,y=80)
    #Password textbox
    Entry(frame, textvariable=password ,show="*").place(x=90,y=82)
    #Label for displaying login status[success/failed]
    Label(frame, text="",textvariable=message).place(x=95,y=100)
    #Login button
    Button(frame, text="Login", width=10, height=1, bg="orange",command=login).place(x=105,y=130)
    win.mainloop()
#calling function Loginform
Loginform()
