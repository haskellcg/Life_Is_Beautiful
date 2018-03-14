## System
  * **sys/system-view**: enter system mode
  * **undo info-center enabel**: turn off echo messages that annoying users
  * **display ip interface brief**: show ip interface and thier state
  * **interface [interface-name]**: enter to [interface-name] interface for configure it
  * **ip address [ip] [mask-len]**: config ip address for interface
  * **ping [ip]**: ping command
  * **commit**: commit configuration
  * **shutdown**: shutdown interface
  * **restart**: restart interface

## BFD
  * **bfd**: enable bfd protocol
  * **bfd [session-name] bind peer-ip [ip] interface [interface-type] [interface-number]**: single hop bfd session create
  * **bfd [session-name] bind peer-ip [ip] interface [interface-type] [interface-number] one-arm-echo**: echo function enable
  * **discriminator local [my-discriminator]**: configure local discriminator
  * **discriminator remote [your-discriminator]**: configure remote discriminator
  

## References
  * **[interface-name]**: just like "Vlanif1" or "Ethernet0/0/1"
  * **[interface-type]**: just like "Vlanif" or "Ethernet"
  * **[interface-number]**: just like "1" or "0/0/1"
