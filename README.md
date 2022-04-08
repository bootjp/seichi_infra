# `seichi_infra`

seichi.click networkのオンプレ環境のうち、公開可能な箇所を管理するレポジトリです。

概要図は [`diagrams`](./diagrams) 以下で、 draw.io によってパース可能なsvgファイルとして管理されています。これらを編集する場合は [Draw.io VS Code Integration](https://github.com/hediet/vscode-drawio) の利用を推奨します。

## 用語の定義

### `seichi-onp-network` / OnPネットワーク

unchama宅のルーター配下のLAN (subnet 192.168.0.0/20)。マイクラサーバーや一部のウェブサーバーなどはこのネットワークに属する(物理、及び仮想)サーバー達により提供されている。

## ディレクトリ構成

 - [`diagrams`](./diagrams/)
   - 概要図、ネットワーク構成図などの図を draw.io で描いて管理するディレクトリ。
   - 2022/03/18現在、GitHubがmermaidのレンダリングを正式にサポートしたため、新しい図はmermaidで作成して良いかも

 - [`helm-charts`](./helm-charts/)
   - [`proxy-kubernetes`](./proxy-kubernetes/) 等で使用できる汎用的な [Helm chart repository](https://helm.sh/docs/topics/chart_repository/)。

 - [`proxy-kubernetes`](./proxy-kubernetes/)
   - Linode Kubernetes Engine(LKE) 上の k8s クラスタの定義を管理するディレクトリ。詳細は [README](./proxy-kubernetes/README.md) を参照してください。
 
 - [`terraform`](./terraform/)
   - [Terraform Cloud](https://app.terraform.io/app/GiganticMinecraft/workspaces/seichi_infra) に管理させているインフラ全般の設定です。
   - 2022/03/18現在、 Terraform Cloud 管理下にある設定および定義は以下の通りです
     - GitHub Teamsの定義
     - Cloudflare周りの設定
       - 証明書の管理
       - GitHub Teamsを用いたアクセス制御の定義
     - LKE上の一部オブジェクトの管理
       - Cloudflareが発行したトークンを含むSecretリソース

 - [`seichi-onp-network-iap`](./seichi-onp-network-iap/README.md)
   - OnPネットワーク内に置いてあるサービスを公開するためのプロキシの設定

 - [`util-scripts`](./util-scripts/)
   - サーバーなどが利用できるように組まれた雑多なインストールスクリプト等を管理しています。

## ライセンスについて

本リポジトリで記述されている設定自体は[ライセンス](./LICENSE.md)の範囲内で利用していただけます。

ただし、BungeeCordのサービス定義は、[著作権で保護されている、まいんちゃんのサーバーアイコン](https://github.com/GiganticMinecraft/branding)をダウンロードして利用するように設定されています。当該設定を流用する場合は[`branding` レポジトリ](https://github.com/GiganticMinecraft/branding)の利用許諾に記載されている条件に従う必要があるため、以下のどちらかを満たすように設定してください：
 - BungeeCord の Deployment リソースでのサーバーアイコンのURL指定(`SERVER_ICON_URL` 環境変数)をまいんちゃんアイコン以外のものに差し替える
 - 不特定多数が BungeeCord に接続できないようにする
