# EHM
Hur jag hat fått till min uppsättning.

## VMWare och Arch

Tack vare att jag hade tillgång till en färdiguppsatt VM via Ubuntu Mate 2025, så hade jag all information jag behövde
för att jag skulle kunna sätta upp min egna VM.

### Installation
Vid installation av Arch stötte jag på vissa problem.
Jag valde UEFI istället för BIOS (även om UM2025 körde BIOS), och möttes direkt av problem i installeraren.
Kör även utan 3D accelerated graphics.

Jag behövde göra flera saker.
1. Sätta upp `HTTP_PROXY`, `HTTPS_PROXY`, `http_proxy`, `https_proxy` till `"http://proxy.ehint.ehalsomyndigheten.se:8087"`
2. Ställa in rätt tidszon och tangentbordslayout.

Installerade sedan som vanligt, för utan proxy kom jag inte åt arch paketserver.

### Post installation

Behvöde i `/etc/environment` sätta upp proxyvariablerna, samt några `NO_PROXY`-variabler

Viktigt här för mig är att jag också satte upp `WLR_RENDERER=pixman` och `WLR_NO_HARDWARE_CURSORS=1` för att ge mig en cursor, plus att använda pixman istället för 3d accelerated graphics renderer av Sway som jag sedan installerade.

Installerade såklart sway, fish och mina andra paket etc. som jag har definerad konfiguration för i chezmoi repo.

### Utvecklingsmiljö

Var tvungen för att få Maven att fungera, att signa i min .m2/ mapp med det certifikat som behövs för att maven ska komma åt vioxx och nexus.
Satte även proxy för npmrc

### Firefox

I Firefox satte jag automatic proxy configuration url till `http://proxy.ehint.ehalsomyndigheten.se/proxyutv.pac` som hämtade det jag behövde för att FF skulle lira ordentligt.

#### Smart Card

För att även på confluence och minnet att lira, så var jag tvungen att installera pcsc-tools och ccid för att komma åt mitt smart card.
Här satte jag också upp `sudo systemctl enable --now pcscd`

Fick även installera NetiDAccessSetup, där jag fick skriva om install-skriptet till att använda pcsc-tools istället. Kan ha varit något mer.

I FF så fick jag lägga till en Security Device där jag la till NetID Moudle med path då till `/usr/bin/netid-access/libnetid.so`

Sen fick jag också i min VM koppla på den Shared SmartCard reader, och sedan "plugga in" kortet också i den undermenyn. pcsc_scan kunde då hitta kortet. Jag satte också upp en profil i FF

Ändrade i min .vmx-fil till att köra `usb.autoConnect.device0 = 0x0e0f:0x0004` (dubbelkolla detta mot lsusb)

### Kalender

I outlook kuinde jag publicera min kalender, där jag fick ut en .ics URL som jag m.h.a. vdirsync kunde hämta filen var 10 minut, och sedan få ikhal att konsumera den.

Skript finns i repo för både systemd och .sh skript

### Mail

Verkar som att mailen på EHM går via Kerberos, då jag inte behöver logga in eller något där.

Installerade kerberos med `sudo pacman -S krb5 bind` (bind krävs för dig).

Tyvärr så kom jag inte hela vägen på grund av att jag saknade ett rotcertifikat för att verifiera min förfrågan till servern. Denna ges endast från AD, och finns inte på datorn, så jag kan inte hämta den.

#### Fungerar

* ✅ Smartkort + Net iD
* ✅ PKCS#11
* ✅ Kerberos‑kontakt med KDC
* ✅ PKINIT klientsida (användarcert)
* ✅ Rätt realm/KDC/DNS

#### Fungerar inte

* ❌ PKINIT KDC‑verifiering (saknad KDC‑issuing‑CA)
