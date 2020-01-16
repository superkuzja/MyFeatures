chcp 65001

call vrunner vanessa --settings tools\vrunner.json --path features

call allure generate --clean ./out/allure && allure open --host localhost