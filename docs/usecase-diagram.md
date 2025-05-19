# ユースケース

```mermaid
graph TD
  %% アクター
  User([ユーザー])
  Admin([管理者])

  %% ユーザーフロー
  User --> List[コンテンツ一覧を閲覧]
  List --> Detail[コンテンツ詳細を表示]
  Detail --> Player[コンテンツを再生]

  %% 管理者フロー
  Admin --> Manage[コンテンツを管理]
  Manage --> Create[新規登録]
  Manage --> Edit[編集]
  Manage --> Delete[削除]

  %% 管理者の操作とユーザーへの影響
  Create -->|提供| List
  Edit -->|反映| List
  Delete -->|非表示| List

