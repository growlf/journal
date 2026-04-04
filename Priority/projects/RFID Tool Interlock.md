We need a way to control access to tools that require training based on RFID badges.

## Initial thoughts
We should create a self contained RFID reader in a lockable junction box. Basing it on ESPHome would probably be the most convenient for ease of integration.

## Features
* RFID reader
* LCD Display
* Manual override switch inside locked box (in case of wifi failure)
* ESPHome for integration with NodeRed/HomeAssistant
* Relay control with sufficient capacity for high current tools
* Current sensing
* Cost tracking ($/minute of runtime, for example laser runtime)
* Physical button with RGB LED for logging out when finished with tool, and status indication
* Remote lockout
* Speaker/buzzer for audible warning before tool timeout or other error status
* Wired ethernet connection if desired
* MQTT with TLS

## Design considerations
Should we create a modular system where the RFID scanning box is separate from the Relay box? This might give us more flexability for placement of the reader vs. where the tool needs to plug in. It would also simplify the relay box to maybe a single esphome relay and an led or two for power/status. The downside being that if something goes wrong you might get a successful scan, but then the tool is not enabled.
In this setup, we could have a single Relay box contain multiple relays and control multiple tools, or individual as desired.  

We could potentially utilize the two color e-ink tags to display tool information, lockout status, or a QR code to the tool's wiki page or issue reporting page.
## User stories
### Member
As a tool user I should be able to scan my ID badge to turn on power to a training required tool once I have passed the safety class and have been granted access. An LCD screen should display the time remaining until the tool will automatically power off. If I am running low on time, I should be able to scan my badge again to refresh my time remaining without the tool powering off. Once I am finished using the tool, I should be able to press a button to log out, depowering the tool, and preventing anyone else from using it under my name.

I should be able to tell at a glance if the tool is powered, or if my badge scan failed, or if the tool has been locked out for maintenance. If the tool requires per use payment (laser tube time as an example), the cost should be displayed on the LCD.

### Admin
As an admin user I should be able to assign tool access based on member badges. I should be able to view the status and historical usage of all interlock enabled tools. I should be able to lock out any tool and display a reason message on the LCD. I should be able to set various parameters such as default time interval per scan, cost per minute, or others. It should be easy to integrate the interlock enabled tools with a dashboard or various management platforms. I should be able to easily audit historical tool usage, especially for cases where an accident happened or the tool was damaged. The physical device should secure the power plug for the tool so that it can not be plugged in bypassing the interlock.

## Useful links
ESPHome RFID
https://esphome.io/components/binary_sensor/rc522/

Potential junction box
https://www.polycase.com/wh-02
