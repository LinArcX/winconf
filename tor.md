# Tor
First you should download torbrowser(because it contains obfs4proxy.exe).

obfs4proxy is located here:
`E:\Tor Browser\Browser\TorBrowser\Tor\PluggableTransports\obfs4proxy`

You need it since in your torrc, you need bridges.

- Download Tor-Expert-Bundle:
https://www.torproject.org/dist/torbrowser/10.0/tor-win32-0.4.3.6.zip

C:\tor\Tor\tor.exe -f "C:\tor\Tor\torrc"

- Unzip it, and install as as service:

    `C:\Tor\tor.exe --service install`

- To check if the service with the settings file starts (it does not contain errors), you can use this command:

    `C:\Tor\tor.exe -f "C:\Tor\torrc"`

- Now install the Tor service, which will read the settings from the C:\Tor\torrc file:
	`gsudo C:\tor\Tor\tor.exe --service install -options -f "C:\tor\Tor\torrc"`

* Remember that you must specify options after the -options flag, otherwise they will be ignored.
- To start and stop the service, use the following commands:
    ```
    C:\Tor\tor.exe --service start
    C:\Tor\tor.exe --service stop
    ```

- To remove the service:
    ```
    C:\Tor\tor.exe --service stop
    C:\Tor\tor.exe --service remove
    ```

* Note that you must first stop the service and then delete it.
* By default, the Tor service listens on port 9050.
    So you can check whether it is started by a command that shows if port 9050 is listened:
    `netstat -aon | findstr ":9050"`

## Refrences
- https://miloserdov.org/?p=1839
