# AWS Terraform EC2

# AMI IDの検索
## マネジメントコンソールでの検索
マネジメントコンソールでEC2インスタンス作成画面を開き、「クイックスタート」
または「コミュニティAMI」で確認可能。「AWS Marketplace」で検索してもAMI IDは
表示されない。

CentOSについては、[CentOS>Cloud>AWS](https://wiki.centos.org/Cloud/AWS)に
リージョンごとのAMI IDが記載されている。

## AWS CLIでの検索
例えば、以下のコマンドで、Nmaeが「RHEL」から始まり「7.5」を含むイメージを
検索し、NameとImageIdを出力されることができる。

```
$ aws ec2 describe-images --filters "Name=name,Values=RHEL*7.5*" --region ap-northeast-1 --query "Images[].{Name:Name, ImageId:ImageId}" --output text
```

出力例:

```
ami-471b7921    RHEL-7.5_Beta_HVM-20180116-x86_64-2-Hourly2-GP2
ami-6b0d5f0d    RHEL-7.5_HVM_GA-20180322-x86_64-1-Hourly2-GP2
```


