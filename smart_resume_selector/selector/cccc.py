# from threading import Thread
# from time import sleep
# import sys
#
# def timer():
#     for i in range(3):
#         sleep(1)   #waits 45 seconds
#     sys.exit() #stops program after timer runs out, you could also have it print something or keep the user from attempting to answer any longer
#
# def question():
#     answer = input("foo?")
#
# t1 = Thread(target=timer)
# t2 = Thread(target=question)
# t1.start() #Calls first function
# t2.start() #Calls second function to run at same time
import time

# Timer starts
starttime = time.time()
lasttime = starttime
lapnum = 1
value = ""

print("Press ENTER for each lap.\nType Q and press ENTER to stop.")

while value.lower() != "q":

    # Input for the ENTER key press
    value = input()

    # The current lap-time
    laptime = round((time.time() - lasttime), 2)

    # Total time elapsed since the timer started
    totaltime = round((time.time() - starttime), 2)

    # Printing the lap number, lap-time, and total time
    print("Lap No. "+str(lapnum))
    print("Total Time: "+str(totaltime))
    print("Lap Time: "+str(laptime))

    print("*"*20)

    # Updating the previous total time and lap number
    lasttime = time.time()
    lapnum += 1

print("Exercise complete!")
