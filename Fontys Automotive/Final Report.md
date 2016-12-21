# Fontys Automotive DriveSim Report

January 2015

## Team Members

- Ashish Kumar: 2198894
- Todor Kosev: 2185333
- Edson Sint Jago: 2158973
- Simon van Amstel: 2179985
- Rudi Jansen: 2181820
- Konstantin Indjov: 2203762
- Tsvetomir Yotov: 2205631

## Introduction to DriveSim

DriveSim is a driving simulator and virtual city builder, replete with a plethora of roads and buildings. DriveSim's simple interface allows users to easily manipulate the environment without the need to understand the intricacies of software programming.

DriveSim’s real-world applications range from simulating traffic conditions, to training student drivers in a safe environment.

## Technology

- DriveSim is a Unity project. 
- All objects are created in 3DsMax and are imported into Unity as .fbx models.

- The current Physics Engine is a separate project.
- It's written in C# with Windows Forms for the GUI inspector. 
- It implements a set of MATLAB models, and is divided into two parts: Turning, and Acceleration.

## User Manual

### DriveSim Unity


### Physics Engine GUI

The car can be controlled using the keyboard keys:

- W, S change throttle input
- A, D change steer angle
- Q, E change brake input
- G toggles Reverse Mode

## Progress Report

### The Grid

- add new roundabouts and turns
- objects take appropriate number of cells depending on their size
- overlapping of objects is not possible anymore. 
- fixed hovering over grid

- Overlapping of objects does not work with multi select 
- AI cars cannot run on big objects like roundabouts and big turns

### Physics Engine

- implemented turning, acceleration, and braking based on MATLAB models provided by the project leader, Roel.

- Reversing is partially implemented, but uses negative acceleration instead of realistic equations.
- When the car is stationary, 
- The Physics Engine has a separate Windows Forms project that hasn't yet been implemented in Unity. 

### GUI

- Added the possibility to place roadsigns next to a straight piece of road.
- Added a new menu for the roadrules
- Added new button for a shortcut overview.
- Stopped program from crashing when you place a sign.
- Added new save and load messageboxes.
- Fix camera center on backspace.
- Reset world on enter press.


## Problems Encountered

- Buttons are textures and not actual buttons. They can't be dragged and dropped, but it is done with raycasting.
- Gui works by raycasting, if you click a button you click on everything behind the button as well.
- Unity freezes after you run the program from the editor.
- GUI dissapears after you build the program.


## Suggestions for Future Groups

Discard the current implementation of the Unity project, and build it from scratch. The new Physics Engine that was built by us can be easily integrated into a new DriveSim.

The 3D objects that were built by us can be used as a base for a new DriveSim.



