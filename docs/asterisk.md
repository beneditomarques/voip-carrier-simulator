  
 - sip.conf

```
register => operadora-1:dd22c3a768b356e974613b2ea3d93681@sip.operadora1.com.br:5080/SIMULADOR-OPERADORA1

[SIMULADOR-OPERADORA1]
type=friend
context = tronco-SIMULADOR-OPERADORA1
host = sip.operadora1.com.br
port=5080
nat = no
fromuser = operadora-1
qualify = yes
allow = !all,alaw,ulaw
```

 - iax.conf:

```
register => operadora-2:99aa12e79ab46d65161c1fad83f4945a@iax.operadora2.com.br:4570/SIMULADOR-OPERADORA2

[SIMULADOR-OPERADORA2]
type=friend
host=iax.operadora2.com.br
port=4570
trunk=yes
secret=99aa12e79ab46d65161c1fad83f4945a
context=tronco-SIMULADOR-OPERADORA2
```

 - pjsip.conf

```
[SIMULADOR-OPERADORA1]
type=aor
qualify_frequency=60
contact=sip:operadora-1@192.168.100.127:5080
support_path=no

[SIMULADOR-OPERADORA1]
type=auth
auth_type=userpass
password=dd22c3a768b356e974613b2ea3d93681
username=operadora-1

[SIMULADOR-OPERADORA1]
type=identify
endpoint=SIMULADOR-OPERADORA1
match=192.168.100.127:5080

[SIMULADOR-OPERADORA1]
type=registration
endpoint=SIMULADOR-OPERADORA1
line=yes
outbound_auth=SIMULADOR-OPERADORA1
server_uri=sip:192.168.100.127:5080
client_uri=sip:operadora-1@192.168.100.127:5080
auth_rejection_permanent=no
expiration=3600
max_retries=10
retry_interval=15
transport=transport-udp

[SIMULADOR-OPERADORA1]
type=endpoint
aors=SIMULADOR-OPERADORA1
disallow=all
outbound_auth=SIMULADOR-OPERADORA1
allow=alaw,ulaw
context=from-pstn
direct_media=no
dtmf_mode=rfc4733
fax_detect=no
from_user=operadora-1
rewrite_contact=yes
rtp_symmetric=yes
t38_udptl=no
t38_udptl_ec=none
t38_udptl_nat=no
transport=transport-udp
trust_id_inbound=no
```

 - extensions.conf (Exemplo com rotas apenas para o número 08007778080. Ajuste conforme sua necessidade. )

```
;Discagem pela operadora 1 (chan_sip)
 exten => _08007778080,1,Dial(SIP/SIMULADOR-OPERADORA1/08007778080)
  same =>              n,Hangup()

;Discagem pela operadora 1 (chan_pjsip)
 exten => _08007778080,1,Dial(PJSIP/08007778080@SIMULADOR-OPERADORA1)
  same =>              n,Hangup()

;Discagem pela operadora 2 (iax)
 exten => _08007778080,1,Dial(IAX2/SIMULADOR-OPERADORA2/08007778080)
  same =>              n,Hangup()

```
