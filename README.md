# rdrp_notifications

### What is this?

* I had this a long time ago and found it now.

### Features
- A notification system based on 3D text.
- They will show infront of you player.
- Stackable notifications and after a certain amount of time they will fade out.

## Download & Installation

### Using Git
```
cd resources
git clone https://github.com/qalle-fivem/rdrp_notifications
```

### Manually
- Download from this.

## Installation
- Add this to your `server.cfg`:

```
start rdrp_notifications
```

## Example

* This will send a notification with the text ``You earned ~g~$5`` and it will be removed after ``10000ms``

```lua
    exports["rdrp_notifications"]:AddNotification("You earned ~g~$5", 10000)
```

* This will send a notification with an event.

```lua
    TriggerEvent("rdrp_notifications:sendNotification", "You earned ~g~$5")
    TriggerClientEvent("rdrp_notifications:sendNotification", source, "You earned ~g~$5")
```

![Notification](https://godhatesfags.church/2xWR1BvWNPSudA6.png)


