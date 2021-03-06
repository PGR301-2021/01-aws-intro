# Intro til AWS

I denne øvelsen skal dere bli bedre kjent med Amazon AWS, og hvordan dere kan bruke kommando-linje
verktøy for å få tilgang til virtuelle maskiner i tjenesten EC2

Etter denne øvelsen vil du være i stand til å 

- Logge inn i AWS console med en IAM bruker 
- Navigere til ulike tjenester of finne EC2 og EC2 Dashboard 
- Logge inn på en EC2 instans fra en terminal på din maskin
- Forklare hvordan AWS bruker nøkler for autentisering og autorisasjon


## Forbredelser

* Installer AWS CLI på din maskin - <https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html>
* Installer Session Maanger Plugin for AWS CLI - <https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html>
## Konfigurer AWS CLI

Kjør kommandoen 

```bash
aws configure
```

Eksempel input kan være slik 

```hcl-terraform
AWS Access Key ID [****************ITGC]:
AWS Secret Access Key [****************aY6j]:
Default region name [eu-north-1]:
Default output format [json]:
```


Bruk Acess key ID og Secret Access Key du har fått i forelesning. Test at du kan akesessere AWS miljøet 

```bash
aws ec2 describe-instances
```

## Logg på AWS console

* Logg på med brukeren du har fått i forelesning (kristiania) og passord <https://244530008913.signin.aws.amazon.com/console>
* Naviger til EC2 tjenesten

## Test forbindelse til din egen testmaskin 

* Finn EC2 instansen med ditt navn 
* Kopier EC2 instans ID (i-1234xyz)

Koble det til maskinen med kommandoen

```hcl-terraform
aws ssm start-session --target <instance-id>
```

Du er nå logget inn på en Linux server i skyen! La oss se hva vi får lov til, og ikke får lov til fra denne  
maskinen 

## Test tilganger fra Ec2

```bash
aws ec2 describe-instances
```

 Reflekter litt over hvorfor du dette ikke går bra 


## Konfigurer AWS CLI på EC2 Instansen

Mens du er koplet opp mot din egen Ec2 instans. Kjør kommandoen 

```bash
aws configure
```

## Test tilganger fra EC2 instansen

```bash
aws ec2 describe-instances
```

## Kjør Python programmet som ligger på maskinen 


```hcl-terraform

export AWS_DEFAULT_REGION=eu-north-1
sudo su ec2-user
cd
pip3 install boto3
python3 boto3_example.py
```

Legg merke til at programmet kjøre med de samme rettigheter som ditt shell. 


## bonus: Lek litt med EC2 instansen

Logg på AWS Console <https://244530008913.signin.aws.amazon.com/console> og bli kjent med grensesnittet. 
Du kan for eksempel gjerne forsøke å bytte instanstype på EC2 instansen. Får du lov til det? Forsøk gjerne å 

- Legge merke til IP addressen på instansen 
- Lage en fil på instansen
- Stopp instansen
- Start instansen 
- Er filen der? 
- Er IP addressen den samme? 

Reflekter.

