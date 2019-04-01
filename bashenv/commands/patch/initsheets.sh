#!/bin/bash
# initsheets

print_help() {
printf "`cat << EOF
${BLUE}kd tool initsheets${NC}

write out commands to add and tag initial sheets

EOF
`\n"
}

addptr() {
  echo tool docptr --name "$2" add --tag all --tag sheets --update google-worksheet --sheet "$1:$2"
}

run() {
     addptr 1ho3VpSkGZ3aChBq5Zo1A6-92WZA_Z-e0mGYPX34TDcA "People"
     addptr 1EIxsrSZEJu2DmyBL0Mu8n4Xb3K2T-8SqKHcqu1H2eKI "KumuControl"
     addptr 1vPShoBexOtoVejJ-hrctWwnv3X95sMPZAsGUCk9J_ow "Organizations"
     addptr 1RkGaLugwLVN4yG1siA-TixW9U3Cl2FLgFcChPeY4ZRs "MarkusandInfominerCombined"
     addptr 1u6y9cJk1taFcPzpyVOREbMNnCSyJmOI6uIr9V3PZvV4 "Infominer33_2_"
     addptr 17Oheg8JlMRQeA4YWLkCfcVK_tOy7DqRorACNIsd8cY0 "infominer33"
     addptr 1AoT7bokByHljwgleV3kBDxZ4CFzttiJtJJ6M0a_fnLk "MarkusSabadello"
     addptr 10F0mcqrtxg4RkweGmKmCrWdrbvGcmtP807UNUT8xUnQ "W3C"
     addptr 1qCn5Ec4LhZGLEZo1e_dGN0vc5YGoLg3SivMuEeu2xgU "Index"
     addptr 19-Lu0YDz8oY8Dc08j4jTkm1ghN2PM1Sv3uhk9Ma5wU0 "DIF-DecentralizedIdentityFoundation"
     addptr 1ymaZeogJBagjwRS6Fjgm2nBb4xaqrWX9K1ionzo29uI "IANA"
     addptr 10BHWzKRDhDGs2_mYnz_hmOqu6uOu69OSPEsbys-Qn-0 "OASIS"
     addptr 1QaxTWZKylLPaizjLt8xDZcy8NchFUhykb4TnZwfKweA "IETF"
     addptr 1TVzSmVCvEWetoTh_ipNxRYON2e9FkHp64Yvir4__Re0 "W3C"
     addptr 1f9zFqvlXtQWOXXlpHBqH7TtJKsWcozX8y7GBPtgK468 "GovernmentofCanada"
     addptr 1kvrEChg-eaUvyc2ZAKCD8fJempLn6Wf9T5RTZyydeRM "KantaraInitiative"
     addptr 1W4C_vs3qsd1tRrIv_y19Aewz5DNr8foUXskUNc5OtTc "MSFT-DIF"
     addptr 1BKFYMcaHqLWg5szux7i46WS-aqO2wHPvlOHhDtRUDZE "Hyperledger"
     addptr 1juxOrHA1hNLe-2p6cc1XvlM0Vb3IMWeL0o8ISjjAt2E "Documents"
     addptr 1ffor63-Pczc62Xx0w6dvKrqK4SUJnVmeHJ4urqFEFfk "MyData"
     addptr 1wpxzuEWPJrqSKKMIJqE-KWIXH8CuZJ7MRI7Ui_lUaCs "IIW"
     addptr 1QW_xFKmlug0BS82lHSHzXJkKIarC_1IKxRhMsnrApeY "RWOT"
     addptr 1rbuvazqANsQLuGRR1iUU8MfrdhHS3loDjcMeddoYdtY "CopyofConcepts"
     addptr 1zsjIWWh07zBaYpsUbAhaUpbBq5Ds0TgOtnepObaicHk "Concepts"
     addptr 1rUUHODreEVixBlhqlaTmvITIrGpXhuV-sxbAA4for1Q "Government"
     addptr 1oCKrkiujSG9X7UMjwmLzbDB-DyRQFglnRKCUX2p2IqI "UseCases"
     addptr 1-w6vrNnnLzFjx-28-sfITatIiADsn5E53yMQj1hh5iQ "Specifications"
     addptr 1O6REY82VC3XVVl6KZfKdnkIvw3CrkxQhAIsw9HAZz-E "Repositories"
     addptr 1Hxu4JdOWjSi-yxkeFwelmz6XFBEs07WdpIOGLswHEGw "Products"
     addptr 1Rm-0HpdGquwhYFR_yrpy7Wb-EqO5zJD6I3xRX-JVdQI "BuzzwordsofSSI"
     addptr 11wTdcGfW6yUA3vdsRerxZT88qkgAy4CW2Fic24ewyRA "Events"
     addptr 1Aur-FWKtX0mXwslxs9ifPlms790i_21Zoa5wGtGv1B4 "Documents"
     addptr 1yAg-LO_H-UWUORegXE3xKStmPiik_1mARaOtF3minrg "IdentityTokens"
     addptr 1kjZO7huRfSwnAwbSJyiyCZfQrTQVPzAZHedDNOtSudg "CloudInfrastructure"
     addptr 1rUzpME0zV8IigkYMOoy5XmeRVs37-D0ccVgVjT3aKBY "Veres.One"
     addptr 1NiWhBQA1-G9eXQUnTEhQifaWV7bZrcy1Z0nSPaNb3Ho "ComparingVeres.One_and_Sovrin"
     addptr 1_uiXPOhMIJ-BqanBaFdcwV49n3GvTw0ZqH4skpK3Sh8 "Concepts"
     addptr 1cHqM3c1pjIW2NZ3OASf8rsDdwkGMvHllzL7d5P6fuAk "Organizations"
     addptr 1l9DsvieLNiC7k3_SQcO-DPeOEc8iKa7tMd5ukeYzQ8U "SovrinFoundation"
     addptr 1dnv7ecRwMO45s_ZDK4s1Luu4azH-F2sbd5T1S8vZcXo "Technology"
     addptr 1xFLzm_rAaBSjzvX0Gaqd2xLYWN2oCxBT_84nCQZK8OI "Governance"
     addptr 1Xqy7qLpef4hl2j44dD1OsHQukIDwkGc8ZruFX_VHQlA "Documents"
     addptr 1wwTErL3QLfAAWa2qYrXJKJkEGjrTdDPXaYClIIlVITk "Introduction"
     addptr 1lVzxDp862A537yjWtQ1nI1ThDJsfTix-9uwyzan9Sk8 "Legislation"
     addptr 1tQLA4yVsj5pzcbrHrG2YK05ctctp60gTcm2kgM_f16A "StandardsBodies"
   }
