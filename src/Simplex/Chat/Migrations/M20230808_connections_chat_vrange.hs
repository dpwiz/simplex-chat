{-# LANGUAGE QuasiQuotes #-}

module Simplex.Chat.Migrations.M20230808_connections_chat_vrange where

import Database.SQLite.Simple (Query)
import Database.SQLite.Simple.QQ (sql)

m20230808_connections_chat_vrange :: Query
m20230808_connections_chat_vrange =
  [sql|
ALTER TABLE connections ADD COLUMN chat_vrange_min_version INTEGER NOT NULL DEFAULT 1;
ALTER TABLE connections ADD COLUMN chat_vrange_max_version INTEGER NOT NULL DEFAULT 1;
|]

down_m20230808_connections_chat_vrange :: Query
down_m20230808_connections_chat_vrange =
  [sql|
ALTER TABLE connections DROP COLUMN chat_vrange_max_version;
ALTER TABLE connections DROP COLUMN chat_vrange_min_version;
|]