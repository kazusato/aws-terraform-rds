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

# RDS

## パラメータの値
[AWS CLIのマニュアル](https://docs.aws.amazon.com/cli/latest/reference/rds/create-db-instance.html)を参照のこと。

## DBインスタンスができてからやったこと

### Oracle Instant Clientのインストール
- [Oracle Instant Client](http://www.oracle.com/technetwork/jp/database/features/instant-client/index-097480-ja.html)

「Instant Client for Linux x86-64」からダウンロードページを開き、以下のモジュール（RPM）をダウンロードしてインストールする。

- oracle-instantclient12.2-basic-12.2.0.1.0-1.x86_64.rpm
- oracle-instantclient12.2-jdbc-12.2.0.1.0-1.x86_64.rpm
- oracle-instantclient12.2-sqlplus-12.2.0.1.0-1.x86_64.rpm
- oracle-instantclient12.2-tools-12.2.0.1.0-1.x86_64.rpm

インストール手順は、同ページ下部に記載されている。
tnsnames.oraは、以下のように作成すればよい（HOST=の値はRDSインスタンス生成後にマネジメントコンソール等でエンドポイントの値を確認する）。

```
rdsora01=
 (DESCRIPTION=
  (ADDRESS=(PROTOCOL=tcp)(HOST=hostname.xxxxxxxxxx.ap-northeast-1.rds.amazonaws.com)(PORT=1521))
  (CONNECT_DATA=(SERVICE_NAME=RDSORA01))
 )
```

### sqlplusでの接続

Linux x86-64向けインスタントクライアントをインストールすると、SQL*Plusは/usr/bin/sqlplus64としてインストールされる。
上記の通りtnsnames.oraを設定した場合、DBへの接続コマンドは以下の通りとなる（ユーザ名はTerraformで指定したもの。大文字・小文字は区別されない）。

```
$ sqlplus64 rdsora@RDSORA01
```

## 参考資料
- [Terraform AWS RDS Complete Oracle](https://github.com/terraform-aws-modules/terraform-aws-rds/blob/master/examples/complete-oracle/main.tf)
- [Oracle DB インスタンスの一般的な DBA タスク](https://docs.aws.amazon.com/ja_jp/AmazonRDS/latest/UserGuide/Appendix.Oracle.CommonDBATasks.html)
