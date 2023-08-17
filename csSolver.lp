\ Model ARP
\ LP format - for model browsing. Use MPS format to capture full model detail.
Minimize
  9 x[1,6] + 3 x[7,2] + 2 x[3,8] + x[9,4] + 8 x[5,10] + 9 x[6,11]
   + 2 x[12,7] + 3 x[8,13] + 9 x[14,9] + 8 x[10,15] + 4 x[11,16]
   + 3 x[17,12] + 8 x[13,18] + 9 x[19,14] + 3 x[15,20] + 8 x[16,21]
   + 4 x[22,17] + 8 x[18,23] + 9 x[24,19] + x[20,25] + 4 x[1,2] + 4 x[2,1]
   + 2 x[2,3] + 2 x[3,2] + 10 x[3,4] + 10 x[4,3] + 8 x[4,5] + 8 x[5,4]
   + 2 x[6,7] + 2 x[7,6] + 2 x[7,8] + 2 x[8,7] + 7 x[8,9] + 7 x[9,8]
   + 8 x[9,10] + 8 x[10,9] + 8 x[11,12] + 8 x[12,11] + 4 x[12,13]
   + 4 x[13,12] + 2 x[14,13] + 2 x[13,14] + 8 x[14,15] + 8 x[15,14]
   + 4 x[16,17] + 8 x[17,16] + 8 x[17,18] + 4 x[18,17] + 3 x[18,19]
   + 3 x[19,18] + 2 x[19,20] + 2 x[20,19] + 8 x[21,22] + 8 x[22,21]
   + 3 x[22,23] + 3 x[23,22] + 11 x[23,24] + 11 x[24,23] + 8 x[24,25]
   + 8 x[25,24]
Subject To
 VisitarTodosArcos[1,6]: x[1,6] >= 1
 VisitarTodosArcos[7,2]: x[7,2] >= 1
 VisitarTodosArcos[3,8]: x[3,8] >= 1
 VisitarTodosArcos[9,4]: x[9,4] >= 1
 VisitarTodosArcos[5,10]: x[5,10] >= 1
 VisitarTodosArcos[6,11]: x[6,11] >= 1
 VisitarTodosArcos[12,7]: x[12,7] >= 1
 VisitarTodosArcos[8,13]: x[8,13] >= 1
 VisitarTodosArcos[14,9]: x[14,9] >= 1
 VisitarTodosArcos[10,15]: x[10,15] >= 1
 VisitarTodosArcos[11,16]: x[11,16] >= 1
 VisitarTodosArcos[17,12]: x[17,12] >= 1
 VisitarTodosArcos[13,18]: x[13,18] >= 1
 VisitarTodosArcos[19,14]: x[19,14] >= 1
 VisitarTodosArcos[15,20]: x[15,20] >= 1
 VisitarTodosArcos[16,21]: x[16,21] >= 1
 VisitarTodosArcos[22,17]: x[22,17] >= 1
 VisitarTodosArcos[18,23]: x[18,23] >= 1
 VisitarTodosArcos[24,19]: x[24,19] >= 1
 VisitarTodosArcos[20,25]: x[20,25] >= 1
 VisitarTodosArcosBidireccionales[1,2,2,1]: x[1,2] + x[2,1] >= 1
 VisitarTodosArcosBidireccionales[2,3,3,2]: x[2,3] + x[3,2] >= 1
 VisitarTodosArcosBidireccionales[3,4,4,3]: x[3,4] + x[4,3] >= 1
 VisitarTodosArcosBidireccionales[4,5,5,4]: x[4,5] + x[5,4] >= 1
 VisitarTodosArcosBidireccionales[6,7,7,6]: x[6,7] + x[7,6] >= 1
 VisitarTodosArcosBidireccionales[7,8,8,7]: x[7,8] + x[8,7] >= 1
 VisitarTodosArcosBidireccionales[8,9,9,8]: x[8,9] + x[9,8] >= 1
 VisitarTodosArcosBidireccionales[9,10,10,9]: x[9,10] + x[10,9] >= 1
 VisitarTodosArcosBidireccionales[11,12,12,11]: x[11,12] + x[12,11] >= 1
 VisitarTodosArcosBidireccionales[12,13,13,12]: x[12,13] + x[13,12] >= 1
 VisitarTodosArcosBidireccionales[14,13,13,14]: x[14,13] + x[13,14] >= 1
 VisitarTodosArcosBidireccionales[14,15,15,14]: x[14,15] + x[15,14] >= 1
 VisitarTodosArcosBidireccionales[16,17,17,16]: x[16,17] + x[17,16] >= 1
 VisitarTodosArcosBidireccionales[17,18,18,17]: x[17,18] + x[18,17] >= 1
 VisitarTodosArcosBidireccionales[18,19,19,18]: x[18,19] + x[19,18] >= 1
 VisitarTodosArcosBidireccionales[19,20,20,19]: x[19,20] + x[20,19] >= 1
 VisitarTodosArcosBidireccionales[21,22,22,21]: x[21,22] + x[22,21] >= 1
 VisitarTodosArcosBidireccionales[22,23,23,22]: x[22,23] + x[23,22] >= 1
 VisitarTodosArcosBidireccionales[23,24,24,23]: x[23,24] + x[24,23] >= 1
 VisitarTodosArcosBidireccionales[24,25,25,24]: x[24,25] + x[25,24] >= 1
 ConservacionDeFlujoPuntas[3,1]: - x[3,8] + x[2,3] - x[3,2] - x[3,4]
   + x[4,3] + s_i[3] - t_i[1] = 0
 ConservacionDeFlujoPuntas[5,2]: - x[5,10] + x[4,5] - x[5,4] + s_i[5]
   - t_i[2] = 0
 ConservacionDeFlujoPuntas[6,3]: x[1,6] - x[6,11] - x[6,7] + x[7,6]
   + s_i[6] - t_i[3] = 0
 ConservacionDeFlujoCentro[1]: - x[1,6] - x[1,2] + x[2,1] - t_i[1] = 0
 ConservacionDeFlujoCentro[2]: x[7,2] + x[1,2] - x[2,1] - x[2,3] + x[3,2]
   - t_i[2] = 0
 ConservacionDeFlujoCentro[4]: x[9,4] + x[3,4] - x[4,3] - x[4,5] + x[5,4]
   - t_i[4] = 0
 ConservacionDeFlujoCentro[7]: - x[7,2] + x[12,7] + x[6,7] - x[7,6]
   - x[7,8] + x[8,7] - t_i[7] = 0
 ConservacionDeFlujoCentro[8]: x[3,8] - x[8,13] + x[7,8] - x[8,7] - x[8,9]
   + x[9,8] - t_i[8] = 0
 ConservacionDeFlujoCentro[9]: - x[9,4] + x[14,9] + x[8,9] - x[9,8]
   - x[9,10] + x[10,9] - t_i[9] = 0
 ConservacionDeFlujoCentro[10]: x[5,10] - x[10,15] + x[9,10] - x[10,9]
   - t_i[10] = 0
 ConservacionDeFlujoCentro[11]: x[6,11] - x[11,16] - x[11,12] + x[12,11]
   - t_i[11] = 0
 ConservacionDeFlujoCentro[12]: - x[12,7] + x[17,12] + x[11,12] - x[12,11]
   - x[12,13] + x[13,12] - t_i[12] = 0
 ConservacionDeFlujoCentro[13]: x[8,13] - x[13,18] + x[12,13] - x[13,12]
   + x[14,13] - x[13,14] - t_i[13] = 0
 ConservacionDeFlujoCentro[14]: - x[14,9] + x[19,14] - x[14,13] + x[13,14]
   - x[14,15] + x[15,14] - t_i[14] = 0
 ConservacionDeFlujoCentro[15]: x[10,15] - x[15,20] + x[14,15] - x[15,14]
   - t_i[15] = 0
 ConservacionDeFlujoCentro[16]: x[11,16] - x[16,21] - x[16,17] + x[17,16]
   - t_i[16] = 0
 ConservacionDeFlujoCentro[17]: - x[17,12] + x[22,17] + x[16,17] - x[17,16]
   - x[17,18] + x[18,17] - t_i[17] = 0
 ConservacionDeFlujoCentro[18]: x[13,18] - x[18,23] + x[17,18] - x[18,17]
   - x[18,19] + x[19,18] - t_i[18] = 0
 ConservacionDeFlujoCentro[19]: - x[19,14] + x[24,19] + x[18,19] - x[19,18]
   - x[19,20] + x[20,19] - t_i[19] = 0
 ConservacionDeFlujoCentro[20]: x[15,20] - x[20,25] + x[19,20] - x[20,19]
   - t_i[20] = 0
 ConservacionDeFlujoCentro[21]: x[16,21] - x[21,22] + x[22,21] - t_i[21]
   = 0
 ConservacionDeFlujoCentro[22]: - x[22,17] + x[21,22] - x[22,21] - x[22,23]
   + x[23,22] - t_i[22] = 0
 ConservacionDeFlujoCentro[23]: x[18,23] + x[22,23] - x[23,22] - x[23,24]
   + x[24,23] - t_i[23] = 0
 ConservacionDeFlujoCentro[24]: - x[24,19] + x[23,24] - x[24,23] - x[24,25]
   + x[25,24] - t_i[24] = 0
 ConservacionDeFlujoCentro[25]: x[20,25] + x[24,25] - x[25,24] - t_i[25]
   = 0
 NodoInicial: s_i[3] + s_i[5] + s_i[6] = 1
 NodoTerminal: t_i[1] + t_i[2] + t_i[3] + t_i[4] + t_i[5] + t_i[6] + t_i[7]
   + t_i[8] + t_i[9] + t_i[10] + t_i[11] + t_i[12] + t_i[13] + t_i[14]
   + t_i[15] + t_i[16] + t_i[17] + t_i[18] + t_i[19] + t_i[20] + t_i[21]
   + t_i[22] + t_i[23] + t_i[24] + t_i[25] = 1
Bounds
Binaries
 s_i[3] s_i[5] s_i[6] t_i[1] t_i[2] t_i[3] t_i[4] t_i[5] t_i[6] t_i[7]
 t_i[8] t_i[9] t_i[10] t_i[11] t_i[12] t_i[13] t_i[14] t_i[15] t_i[16]
 t_i[17] t_i[18] t_i[19] t_i[20] t_i[21] t_i[22] t_i[23] t_i[24] t_i[25]
Generals
 x[1,6] x[7,2] x[3,8] x[9,4] x[5,10] x[6,11] x[12,7] x[8,13] x[14,9]
 x[10,15] x[11,16] x[17,12] x[13,18] x[19,14] x[15,20] x[16,21] x[22,17]
 x[18,23] x[24,19] x[20,25] x[1,2] x[2,1] x[2,3] x[3,2] x[3,4] x[4,3]
 x[4,5] x[5,4] x[6,7] x[7,6] x[7,8] x[8,7] x[8,9] x[9,8] x[9,10] x[10,9]
 x[11,12] x[12,11] x[12,13] x[13,12] x[14,13] x[13,14] x[14,15] x[15,14]
 x[16,17] x[17,16] x[17,18] x[18,17] x[18,19] x[19,18] x[19,20] x[20,19]
 x[21,22] x[22,21] x[22,23] x[23,22] x[23,24] x[24,23] x[24,25] x[25,24]
End
