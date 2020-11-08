# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birthday        | date   | null: false |

### Association

- has_one :item
- has_many :purchases


## items テーブル

| Column          | Type       | Options                       |
| --------------- | ---------- | ----------------------------- |
| nickname        | references | null: false, foreign_key:true |
| name            | string     | null: false                   |
| text            | text       | null: false                   |
| images_id       | integer    | null: false                   |
| category_id     | integer    | null: false                   |
| condition_id    | references | null: false                   |
| postage_pay_id  | string     | null: false                   | 
| prefecture_id   | text       | null: false                   |
| shipping_day_id | integer    | null: false                   |
| price           | integer    | null: false                   |

### Association

- has_many :images
- has_one  :user
- has_one  :purchase


## adresses テーブル

| Column         | Type        | Options                        |
| -------------- | ----------- | ------------------------------ |
| post_code      | string      | null: false                    |
| prefectures_id | integer     | null: false                    |
| city           | string      | null: false                    |
| building_name  | string      | null: false                    |
| phone_number   | string      | null: false                    |
| purchase       | references  | null: false, foreign_key: true |

### Association

- has_one :purchase

## images テーブル

| Column    | Type       | Options                       |
| --------- | ---------- | ----------------------------- |
| item      | references | null: false, foreign_key:true |

## purchases テーブル

### Association

- belongs_to :item

| Column    | Type       | Options                       |
| --------- | ---------- | ----------------------------  |
| users     | references | null: false, foreign_key:true |
| item      | references | null: false                   |

### Association

- belongs_to :user
- has_one :item