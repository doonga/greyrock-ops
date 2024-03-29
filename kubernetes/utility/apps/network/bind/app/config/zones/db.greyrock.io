; Make sure to update the epoch time in the SOA records so coreDNS picks up the changes automatically
; https://www.epochconverter.com/

; SOA Records
$TTL 3600
$ORIGIN greyrock.io.
@ 3600 IN SOA gateway.greyrock.io. gateway.greyrock.io. (
  1682960273         ; serial number (epoch timestamp)
  7200               ; refresh period
  3600               ; retry period
  1209600            ; expire time
  3600               ; minimum ttl
)

; NS Records
@                                   IN  NS gateway.greyrock.io.

; LAN
game-room-u7-pro                    IN  A  10.1.0.22
game-room-usw-flex-mini             IN  A  10.1.0.16
game-room-usw-pro-max-24-poe        IN  A  10.1.0.13
garage-usw-pro-max-24-poe           IN  A  10.1.0.14
gateway                             IN  A  10.1.0.1
kitchen-u7-pro                      IN  A  10.1.0.21
living-room-usw-flex-mini           IN  A  10.1.0.17
office-usw-flex-mini                IN  A  10.1.0.15
office-usp-pdu-pro                  IN  A  10.1.0.31
office-usw-pro-aggregation          IN  A  10.1.0.11
office-usw-pro-max-24-poe           IN  A  10.1.0.12
outdoor-back-u6-mesh                IN  A  10.1.0.24
outdoor-side-driveway-u6-mesh       IN  A  10.1.0.25
outdoor-side-yard-u6-mesh           IN  A  10.1.0.26
upstairs-u7-pro                     IN  A  10.1.0.23

; Servers
k8s1                                IN  A  10.1.1.4
k8s2                                IN  A  10.1.1.5
k8s3                                IN  A  10.1.1.6
nas                                 IN  A  10.1.1.3
pikvm                               IN  A  10.1.1.52

; NTP
time1                               IN  A  10.1.7.2
time2                               IN  A  10.1.7.3
time3                               IN  A  10.1.7.4
time4                               IN  A  10.1.7.5

; IOT
ambient-ws5000                      IN  A  10.1.3.38
bambu-a1-3d-printer                 IN  A  10.1.3.47
basement-hs110-sump-pump            IN  A  10.1.3.45
basement-iotawatt                   IN  A  10.1.3.40
bluetooth-proxy-office-olimex       IN  A  10.1.3.49
brother-printer                     IN  A  10.1.3.13
canon-printer                       IN  A  10.1.3.42
downstairs-litter-robot             IN  A  10.1.3.33
fsr-lg-tv                           IN  A  10.1.3.32
game-room-ps4                       IN  A  10.1.3.11
game-room-ps5                       IN  A  10.1.3.10
game-room-samsung-tv-left           IN  A  10.1.3.29
game-room-samsung-tv-right          IN  A  10.1.3.26
garage-iotawatt                     IN  A  10.1.3.39
garage-door-andy                    IN  A  10.1.3.35
garage-door-todd                    IN  A  10.1.3.34
garage-door-andy-ratgdo             IN  A  10.1.3.43
garage-door-todd-ratgdo             IN  A  10.1.3.44
hvac-dining-room                    IN  A  10.1.3.23
hvac-game-room                      IN  A  10.1.3.24
hvac-kitchen                        IN  A  10.1.3.22
hvac-master-bedroom                 IN  A  10.1.3.21
hvac-office                         IN  A  10.1.3.20
hydrawise-sprinkler-controller      IN  A  10.1.3.25
k8s1-iot                            IN  A  10.1.3.7
k8s2-iot                            IN  A  10.1.3.8
k8s3-iot                            IN  A  10.1.3.9
light-office-ceiling-1              IN  A  10.1.3.50
light-office-ceiling-2              IN  A  10.1.3.51
light-office-ceiling-3              IN  A  10.1.3.52
light-office-ceiling-4              IN  A  10.1.3.53
light-office-lamp                   IN  A  10.1.3.54
motion-sensor-fsr-screek-1u         IN  A  10.1.3.48
motion-sensor-office-screek-1u      IN  A  10.1.3.46
office-hs110-rack                   IN  A  10.1.3.37
office-samsung-tv                   IN  A  10.1.3.30
plug-master-bedroom-fan             IN  A  10.1.3.55
solaredge-inverter                  IN  A  10.1.3.199
nintendo-switch-todd                IN  A  10.1.3.12
slzb-06                             IN  A  10.1.3.36
teslawallconnector-todd             IN  A  10.1.3.41
tesla-model-3-todd                  IN  A  10.1.3.28
upstairs-litter-robot               IN  A  10.1.3.31
withings-scale                      IN  A  10.1.3.27

; Trusted
andys-desktop                       IN  A  10.1.2.11
todds-desktop                       IN  A  10.1.2.10
fsr-appletv                         IN  A  10.1.2.12
game-room-appletv                   IN  A  10.1.2.13
office-appletv                      IN  A  10.1.5.14

; Wireless
andys-iphone                        IN  A  10.1.5.14
andys-ipad                          IN  A  10.1.5.21
formalsittingroom-homepod-left      IN  A  10.1.5.15
formalsittingroom-homepod-right     IN  A  10.1.5.22
game-room-homepod-left              IN  A  10.1.5.24
game-room-homepod-right             IN  A  10.1.5.25
downstairs-bathroom-homepod         IN  A  10.1.5.16
garage-homepod                      IN  A  10.1.5.17
kitchen-homepod                     IN  A  10.1.5.18
masterbedroom-homepod               IN  A  10.1.5.19
office-homepod-left                 IN  A  10.1.5.23
office-homepod-right                IN  A  10.1.5.20
todds-iphone                        IN  A  10.1.5.11
todds-macbook                       IN  A  10.1.5.10
todds-ipad                          IN  A  10.1.5.12
todds-watch                         IN  A  10.1.5.13

; Video
courtyard-porch-doorbell            IN  A  10.1.4.12

; Containers
main                                IN  A  10.5.0.2
onepassword-connect                 IN  A  10.5.0.5

; CNAME records
vpn                                 IN  CNAME  gateway.greyrock.io.
zigbee-coordinator                  IN  CNAME  slzb-06.greyrock.io.
