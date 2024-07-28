# Traffic Light Controller System

## Components

1. **PIC16F877A** - (Our Brain)
2. **4 CA 7-Segment Displays** - (Play as switch on and off of the segments)
3. **2 BCD Counters**
4. **3 Switches**
5. **LEDs and Resistors**

## Features

The project is designed to operate in two modes:
1. **Manual Mode**
2. **Automatic Mode**

### Manual Mode

Manual Mode has two distinct operation methods:

1. **Mode Selection Using Switches 1 & 2**
   - **Switch 1**: Determines the mode (Manual or Automatic).
   - **Switch 2**: Determines which street will be first (West or South) as explained in the video.

2. **Custom Time Control**
   - **Switch 3** (Optional): Allows you to set the duration for which each LED remains on.
   - If Switch 3 is used, it customizes the on-time for each LED. The yellow LED is programmed to stay on for 3 seconds and the 7-segment displays will show this time.
   - If Switch 3 is not used, the default manual mode timing is applied:
     - **Yellow LED**: 3 seconds (shown on the 7-segment display).
     - **Other LEDs**: Programmed for 2 seconds in the code.

### Automatic Mode

In Automatic Mode:
- Switch 1 is used to determine if you are in Automatic Mode.
- The 7-segment displays will automatically show the timing sequence.

#### LED Sequence in Automatic Mode:

1. **Initial State**: 
   - **West Green LED** is on.
   - **South Red LED** is on.

2. **Sequence Timing**:
   - After **20 seconds**, the West Green LED will turn Yellow.
   - After **23 seconds**, the West Yellow LED will turn Red, and the South Red LED will turn Green.

3. **Cycle Repeats**:
   - The sequence repeats with the South Green LED on and the West Red LED on, with the cycle time reduced to **15 seconds**.

## Summary

- **Manual Mode**: Allows for custom control of LED timings and mode selection via switches.
- **Automatic Mode**: Operates on a fixed timing sequence with automatic transitions.

Feel free to refer to the video for detailed explanations and demonstrations of the switch functionalities and LED sequences.
