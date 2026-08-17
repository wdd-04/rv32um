
coremark.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
       0:	00010117          	auipc	sp,0x10
       4:	00010113          	mv	sp,sp
       8:	00007197          	auipc	gp,0x7
       c:	84818193          	addi	gp,gp,-1976 # 6850 <__global_pointer$>
      10:	00006297          	auipc	t0,0x6
      14:	04028293          	addi	t0,t0,64 # 6050 <static_memblk>
      18:	ffc18313          	addi	t1,gp,-4 # 684c <__bss_end>

0000001c <clear_bss_loop>:
      1c:	0062f863          	bgeu	t0,t1,2c <clear_bss_done>
      20:	0002a023          	sw	zero,0(t0)
      24:	00428293          	addi	t0,t0,4
      28:	ff5ff06f          	j	1c <clear_bss_loop>

0000002c <clear_bss_done>:
      2c:	0f4010ef          	jal	ra,1120 <main>

00000030 <end_loop>:
      30:	0000006f          	j	30 <end_loop>

00000034 <cmp_idx>:
      34:	00060a63          	beqz	a2,48 <cmp_idx+0x14>
      38:	00251503          	lh	a0,2(a0)
      3c:	00259783          	lh	a5,2(a1)
      40:	40f50533          	sub	a0,a0,a5
      44:	00008067          	ret
      48:	00051783          	lh	a5,0(a0)
      4c:	01079713          	slli	a4,a5,0x10
      50:	01075713          	srli	a4,a4,0x10
      54:	00875713          	srli	a4,a4,0x8
      58:	f007f793          	andi	a5,a5,-256
      5c:	00e7e7b3          	or	a5,a5,a4
      60:	00f51023          	sh	a5,0(a0)
      64:	00059783          	lh	a5,0(a1)
      68:	00251503          	lh	a0,2(a0)
      6c:	01079713          	slli	a4,a5,0x10
      70:	01075713          	srli	a4,a4,0x10
      74:	00875713          	srli	a4,a4,0x8
      78:	f007f793          	andi	a5,a5,-256
      7c:	00e7e7b3          	or	a5,a5,a4
      80:	00f59023          	sh	a5,0(a1)
      84:	00259783          	lh	a5,2(a1)
      88:	40f50533          	sub	a0,a0,a5
      8c:	00008067          	ret

00000090 <calc_func>:
      90:	fe010113          	addi	sp,sp,-32 # ffe0 <__global_pointer$+0x9790>
      94:	00912a23          	sw	s1,20(sp)
      98:	fd018493          	addi	s1,gp,-48 # 6820 <g_calc_log_count>
      9c:	01512223          	sw	s5,4(sp)
      a0:	0004aa83          	lw	s5,0(s1)
      a4:	01312623          	sw	s3,12(sp)
      a8:	01412423          	sw	s4,8(sp)
      ac:	00112e23          	sw	ra,28(sp)
      b0:	00812c23          	sw	s0,24(sp)
      b4:	01212823          	sw	s2,16(sp)
      b8:	01612023          	sw	s6,0(sp)
      bc:	03f00793          	li	a5,63
      c0:	00050993          	mv	s3,a0
      c4:	00058a13          	mv	s4,a1
      c8:	0757f863          	bgeu	a5,s5,138 <calc_func+0xa8>
      cc:	00051403          	lh	s0,0(a0)
      d0:	001a8793          	addi	a5,s5,1
      d4:	fcf1a823          	sw	a5,-48(gp) # 6820 <g_calc_log_count>
      d8:	40745793          	srai	a5,s0,0x7
      dc:	0017f793          	andi	a5,a5,1
      e0:	07f47493          	andi	s1,s0,127
      e4:	16079063          	bnez	a5,244 <calc_func+0x1b4>
      e8:	40345593          	srai	a1,s0,0x3
      ec:	00f5f593          	andi	a1,a1,15
      f0:	00459713          	slli	a4,a1,0x4
      f4:	00747793          	andi	a5,s0,7
      f8:	00e5e5b3          	or	a1,a1,a4
      fc:	1c078063          	beqz	a5,2bc <calc_func+0x22c>
     100:	00100713          	li	a4,1
     104:	16e79663          	bne	a5,a4,270 <calc_func+0x1e0>
     108:	038a5603          	lhu	a2,56(s4)
     10c:	028a0513          	addi	a0,s4,40
     110:	5b4020ef          	jal	ra,26c4 <core_bench_matrix>
     114:	03ca5783          	lhu	a5,60(s4)
     118:	01051493          	slli	s1,a0,0x10
     11c:	00050913          	mv	s2,a0
     120:	4104d493          	srai	s1,s1,0x10
     124:	14079c63          	bnez	a5,27c <calc_func+0x1ec>
     128:	032a1e23          	sh	s2,60(s4)
     12c:	03f00793          	li	a5,63
     130:	1557e663          	bltu	a5,s5,27c <calc_func+0x1ec>
     134:	0ac0006f          	j	1e0 <calc_func+0x150>
     138:	00050613          	mv	a2,a0
     13c:	000a8593          	mv	a1,s5
     140:	000a0693          	mv	a3,s4
     144:	00004517          	auipc	a0,0x4
     148:	07450513          	addi	a0,a0,116 # 41b8 <__udivdi3+0x434>
     14c:	3b0030ef          	jal	ra,34fc <ee_printf>
     150:	00099403          	lh	s0,0(s3)
     154:	0004a783          	lw	a5,0(s1)
     158:	00004517          	auipc	a0,0x4
     15c:	09450513          	addi	a0,a0,148 # 41ec <__udivdi3+0x468>
     160:	40745493          	srai	s1,s0,0x7
     164:	01041913          	slli	s2,s0,0x10
     168:	0014f493          	andi	s1,s1,1
     16c:	01095913          	srli	s2,s2,0x10
     170:	00178793          	addi	a5,a5,1
     174:	00048613          	mv	a2,s1
     178:	00090593          	mv	a1,s2
     17c:	fcf1a823          	sw	a5,-48(gp) # 6820 <g_calc_log_count>
     180:	37c030ef          	jal	ra,34fc <ee_printf>
     184:	12049063          	bnez	s1,2a4 <calc_func+0x214>
     188:	40345493          	srai	s1,s0,0x3
     18c:	00f4f613          	andi	a2,s1,15
     190:	00461493          	slli	s1,a2,0x4
     194:	038a5803          	lhu	a6,56(s4)
     198:	028a2783          	lw	a5,40(s4)
     19c:	014a2703          	lw	a4,20(s4)
     1a0:	018a2683          	lw	a3,24(s4)
     1a4:	00747b13          	andi	s6,s0,7
     1a8:	00c4e4b3          	or	s1,s1,a2
     1ac:	00048613          	mv	a2,s1
     1b0:	000b0593          	mv	a1,s6
     1b4:	00004517          	auipc	a0,0x4
     1b8:	14050513          	addi	a0,a0,320 # 42f4 <__udivdi3+0x570>
     1bc:	340030ef          	jal	ra,34fc <ee_printf>
     1c0:	180b0663          	beqz	s6,34c <calc_func+0x2bc>
     1c4:	00100793          	li	a5,1
     1c8:	12fb0e63          	beq	s6,a5,304 <calc_func+0x274>
     1cc:	00090593          	mv	a1,s2
     1d0:	00004517          	auipc	a0,0x4
     1d4:	04450513          	addi	a0,a0,68 # 4214 <__udivdi3+0x490>
     1d8:	324030ef          	jal	ra,34fc <ee_printf>
     1dc:	00040493          	mv	s1,s0
     1e0:	038a5603          	lhu	a2,56(s4)
     1e4:	00090593          	mv	a1,s2
     1e8:	00004517          	auipc	a0,0x4
     1ec:	05050513          	addi	a0,a0,80 # 4238 <__udivdi3+0x4b4>
     1f0:	30c030ef          	jal	ra,34fc <ee_printf>
     1f4:	038a5583          	lhu	a1,56(s4)
     1f8:	07f4f493          	andi	s1,s1,127
     1fc:	f0047413          	andi	s0,s0,-256
     200:	00090513          	mv	a0,s2
     204:	0084e433          	or	s0,s1,s0
     208:	5e9020ef          	jal	ra,2ff0 <crcu16>
     20c:	08046413          	ori	s0,s0,128
     210:	01041613          	slli	a2,s0,0x10
     214:	02aa1c23          	sh	a0,56(s4)
     218:	01065613          	srli	a2,a2,0x10
     21c:	00098593          	mv	a1,s3
     220:	00004517          	auipc	a0,0x4
     224:	04c50513          	addi	a0,a0,76 # 426c <__udivdi3+0x4e8>
     228:	2d4030ef          	jal	ra,34fc <ee_printf>
     22c:	00899023          	sh	s0,0(s3)
     230:	038a5603          	lhu	a2,56(s4)
     234:	00048593          	mv	a1,s1
     238:	00004517          	auipc	a0,0x4
     23c:	06850513          	addi	a0,a0,104 # 42a0 <__udivdi3+0x51c>
     240:	2bc030ef          	jal	ra,34fc <ee_printf>
     244:	01c12083          	lw	ra,28(sp)
     248:	01812403          	lw	s0,24(sp)
     24c:	00048513          	mv	a0,s1
     250:	01012903          	lw	s2,16(sp)
     254:	01412483          	lw	s1,20(sp)
     258:	00c12983          	lw	s3,12(sp)
     25c:	00812a03          	lw	s4,8(sp)
     260:	00412a83          	lw	s5,4(sp)
     264:	00012b03          	lw	s6,0(sp)
     268:	02010113          	addi	sp,sp,32
     26c:	00008067          	ret
     270:	01041913          	slli	s2,s0,0x10
     274:	01095913          	srli	s2,s2,0x10
     278:	00040493          	mv	s1,s0
     27c:	038a5583          	lhu	a1,56(s4)
     280:	00090513          	mv	a0,s2
     284:	07f4f493          	andi	s1,s1,127
     288:	f0047413          	andi	s0,s0,-256
     28c:	565020ef          	jal	ra,2ff0 <crcu16>
     290:	0084e433          	or	s0,s1,s0
     294:	02aa1c23          	sh	a0,56(s4)
     298:	08046413          	ori	s0,s0,128
     29c:	00899023          	sh	s0,0(s3)
     2a0:	fa5ff06f          	j	244 <calc_func+0x1b4>
     2a4:	07f47493          	andi	s1,s0,127
     2a8:	00048593          	mv	a1,s1
     2ac:	00004517          	auipc	a0,0x4
     2b0:	02450513          	addi	a0,a0,36 # 42d0 <__udivdi3+0x54c>
     2b4:	248030ef          	jal	ra,34fc <ee_printf>
     2b8:	f8dff06f          	j	244 <calc_func+0x1b4>
     2bc:	02200693          	li	a3,34
     2c0:	038a5783          	lhu	a5,56(s4)
     2c4:	00058713          	mv	a4,a1
     2c8:	00d5d463          	bge	a1,a3,2d0 <calc_func+0x240>
     2cc:	02200713          	li	a4,34
     2d0:	002a1683          	lh	a3,2(s4)
     2d4:	000a1603          	lh	a2,0(s4)
     2d8:	014a2583          	lw	a1,20(s4)
     2dc:	018a2503          	lw	a0,24(s4)
     2e0:	0ff77713          	andi	a4,a4,255
     2e4:	19d020ef          	jal	ra,2c80 <core_bench_state>
     2e8:	03ea5783          	lhu	a5,62(s4)
     2ec:	01051493          	slli	s1,a0,0x10
     2f0:	00050913          	mv	s2,a0
     2f4:	4104d493          	srai	s1,s1,0x10
     2f8:	f80792e3          	bnez	a5,27c <calc_func+0x1ec>
     2fc:	032a1f23          	sh	s2,62(s4)
     300:	e2dff06f          	j	12c <calc_func+0x9c>
     304:	00048593          	mv	a1,s1
     308:	00004517          	auipc	a0,0x4
     30c:	08850513          	addi	a0,a0,136 # 4390 <__udivdi3+0x60c>
     310:	1ec030ef          	jal	ra,34fc <ee_printf>
     314:	038a5603          	lhu	a2,56(s4)
     318:	00048593          	mv	a1,s1
     31c:	028a0513          	addi	a0,s4,40
     320:	3a4020ef          	jal	ra,26c4 <core_bench_matrix>
     324:	00050913          	mv	s2,a0
     328:	00050593          	mv	a1,a0
     32c:	00004517          	auipc	a0,0x4
     330:	08850513          	addi	a0,a0,136 # 43b4 <__udivdi3+0x630>
     334:	1c8030ef          	jal	ra,34fc <ee_printf>
     338:	03ca5783          	lhu	a5,60(s4)
     33c:	01091493          	slli	s1,s2,0x10
     340:	4104d493          	srai	s1,s1,0x10
     344:	de0782e3          	beqz	a5,128 <calc_func+0x98>
     348:	e99ff06f          	j	1e0 <calc_func+0x150>
     34c:	02200793          	li	a5,34
     350:	00048713          	mv	a4,s1
     354:	06f4c263          	blt	s1,a5,3b8 <calc_func+0x328>
     358:	01071493          	slli	s1,a4,0x10
     35c:	4104d493          	srai	s1,s1,0x10
     360:	00048593          	mv	a1,s1
     364:	00004517          	auipc	a0,0x4
     368:	fe450513          	addi	a0,a0,-28 # 4348 <__udivdi3+0x5c4>
     36c:	190030ef          	jal	ra,34fc <ee_printf>
     370:	038a5783          	lhu	a5,56(s4)
     374:	002a1683          	lh	a3,2(s4)
     378:	000a1603          	lh	a2,0(s4)
     37c:	014a2583          	lw	a1,20(s4)
     380:	018a2503          	lw	a0,24(s4)
     384:	00048713          	mv	a4,s1
     388:	0f9020ef          	jal	ra,2c80 <core_bench_state>
     38c:	00050913          	mv	s2,a0
     390:	00050593          	mv	a1,a0
     394:	00004517          	auipc	a0,0x4
     398:	fd850513          	addi	a0,a0,-40 # 436c <__udivdi3+0x5e8>
     39c:	160030ef          	jal	ra,34fc <ee_printf>
     3a0:	03ea5783          	lhu	a5,62(s4)
     3a4:	01091493          	slli	s1,s2,0x10
     3a8:	4104d493          	srai	s1,s1,0x10
     3ac:	e2079ae3          	bnez	a5,1e0 <calc_func+0x150>
     3b0:	032a1f23          	sh	s2,62(s4)
     3b4:	d79ff06f          	j	12c <calc_func+0x9c>
     3b8:	02200713          	li	a4,34
     3bc:	f9dff06f          	j	358 <calc_func+0x2c8>

000003c0 <cmp_complex>:
     3c0:	fe010113          	addi	sp,sp,-32
     3c4:	00812c23          	sw	s0,24(sp)
     3c8:	fd418413          	addi	s0,gp,-44 # 6824 <g_cmp_log_count>
     3cc:	00042803          	lw	a6,0(s0)
     3d0:	00912a23          	sw	s1,20(sp)
     3d4:	01212823          	sw	s2,16(sp)
     3d8:	00112e23          	sw	ra,28(sp)
     3dc:	01312623          	sw	s3,12(sp)
     3e0:	03f00793          	li	a5,63
     3e4:	00058913          	mv	s2,a1
     3e8:	00060493          	mv	s1,a2
     3ec:	0507f463          	bgeu	a5,a6,434 <cmp_complex+0x74>
     3f0:	00180813          	addi	a6,a6,1
     3f4:	00060593          	mv	a1,a2
     3f8:	fd01aa23          	sw	a6,-44(gp) # 6824 <g_cmp_log_count>
     3fc:	c95ff0ef          	jal	ra,90 <calc_func>
     400:	00050413          	mv	s0,a0
     404:	00048593          	mv	a1,s1
     408:	00090513          	mv	a0,s2
     40c:	c85ff0ef          	jal	ra,90 <calc_func>
     410:	40a40433          	sub	s0,s0,a0
     414:	00040513          	mv	a0,s0
     418:	01c12083          	lw	ra,28(sp)
     41c:	01812403          	lw	s0,24(sp)
     420:	01412483          	lw	s1,20(sp)
     424:	01012903          	lw	s2,16(sp)
     428:	00c12983          	lw	s3,12(sp)
     42c:	02010113          	addi	sp,sp,32
     430:	00008067          	ret
     434:	00050713          	mv	a4,a0
     438:	00058693          	mv	a3,a1
     43c:	00050613          	mv	a2,a0
     440:	00050993          	mv	s3,a0
     444:	00058793          	mv	a5,a1
     448:	00004517          	auipc	a0,0x4
     44c:	f9450513          	addi	a0,a0,-108 # 43dc <__udivdi3+0x658>
     450:	00080593          	mv	a1,a6
     454:	0a8030ef          	jal	ra,34fc <ee_printf>
     458:	00042783          	lw	a5,0(s0)
     45c:	00048593          	mv	a1,s1
     460:	00098513          	mv	a0,s3
     464:	00178793          	addi	a5,a5,1
     468:	fcf1aa23          	sw	a5,-44(gp) # 6824 <g_cmp_log_count>
     46c:	c25ff0ef          	jal	ra,90 <calc_func>
     470:	01051993          	slli	s3,a0,0x10
     474:	0109d993          	srli	s3,s3,0x10
     478:	00098593          	mv	a1,s3
     47c:	00050413          	mv	s0,a0
     480:	00004517          	auipc	a0,0x4
     484:	fa450513          	addi	a0,a0,-92 # 4424 <__udivdi3+0x6a0>
     488:	074030ef          	jal	ra,34fc <ee_printf>
     48c:	00048593          	mv	a1,s1
     490:	00090513          	mv	a0,s2
     494:	bfdff0ef          	jal	ra,90 <calc_func>
     498:	40a40433          	sub	s0,s0,a0
     49c:	01051613          	slli	a2,a0,0x10
     4a0:	00040693          	mv	a3,s0
     4a4:	00098593          	mv	a1,s3
     4a8:	01065613          	srli	a2,a2,0x10
     4ac:	00004517          	auipc	a0,0x4
     4b0:	f9850513          	addi	a0,a0,-104 # 4444 <__udivdi3+0x6c0>
     4b4:	048030ef          	jal	ra,34fc <ee_printf>
     4b8:	00040513          	mv	a0,s0
     4bc:	01c12083          	lw	ra,28(sp)
     4c0:	01812403          	lw	s0,24(sp)
     4c4:	01412483          	lw	s1,20(sp)
     4c8:	01012903          	lw	s2,16(sp)
     4cc:	00c12983          	lw	s3,12(sp)
     4d0:	02010113          	addi	sp,sp,32
     4d4:	00008067          	ret

000004d8 <core_list_insert_new>:
     4d8:	fe010113          	addi	sp,sp,-32
     4dc:	00912a23          	sw	s1,20(sp)
     4e0:	01212823          	sw	s2,16(sp)
     4e4:	00068493          	mv	s1,a3
     4e8:	00060913          	mv	s2,a2
     4ec:	0006a683          	lw	a3,0(a3)
     4f0:	00062603          	lw	a2,0(a2)
     4f4:	01312623          	sw	s3,12(sp)
     4f8:	00050993          	mv	s3,a0
     4fc:	01412423          	sw	s4,8(sp)
     500:	00004517          	auipc	a0,0x4
     504:	39c50513          	addi	a0,a0,924 # 489c <__udivdi3+0xb18>
     508:	00058a13          	mv	s4,a1
     50c:	00098593          	mv	a1,s3
     510:	00812c23          	sw	s0,24(sp)
     514:	01512223          	sw	s5,4(sp)
     518:	01612023          	sw	s6,0(sp)
     51c:	00112e23          	sw	ra,28(sp)
     520:	00078b13          	mv	s6,a5
     524:	00070a93          	mv	s5,a4
     528:	7d5020ef          	jal	ra,34fc <ee_printf>
     52c:	00092403          	lw	s0,0(s2)
     530:	00840793          	addi	a5,s0,8
     534:	0b57f463          	bgeu	a5,s5,5dc <core_list_insert_new+0x104>
     538:	0004a703          	lw	a4,0(s1)
     53c:	00470693          	addi	a3,a4,4
     540:	0966f463          	bgeu	a3,s6,5c8 <core_list_insert_new+0xf0>
     544:	00f92023          	sw	a5,0(s2)
     548:	0009a783          	lw	a5,0(s3)
     54c:	002a1503          	lh	a0,2(s4)
     550:	000a1803          	lh	a6,0(s4)
     554:	00f42023          	sw	a5,0(s0)
     558:	0089a023          	sw	s0,0(s3)
     55c:	00e42223          	sw	a4,4(s0)
     560:	0004a703          	lw	a4,0(s1)
     564:	00042603          	lw	a2,0(s0)
     568:	01051793          	slli	a5,a0,0x10
     56c:	00470713          	addi	a4,a4,4
     570:	00e4a023          	sw	a4,0(s1)
     574:	00442683          	lw	a3,4(s0)
     578:	01081713          	slli	a4,a6,0x10
     57c:	0107d793          	srli	a5,a5,0x10
     580:	00a69123          	sh	a0,2(a3)
     584:	01075713          	srli	a4,a4,0x10
     588:	00040593          	mv	a1,s0
     58c:	01069023          	sh	a6,0(a3)
     590:	00004517          	auipc	a0,0x4
     594:	39850513          	addi	a0,a0,920 # 4928 <__udivdi3+0xba4>
     598:	765020ef          	jal	ra,34fc <ee_printf>
     59c:	00040513          	mv	a0,s0
     5a0:	01c12083          	lw	ra,28(sp)
     5a4:	01812403          	lw	s0,24(sp)
     5a8:	01412483          	lw	s1,20(sp)
     5ac:	01012903          	lw	s2,16(sp)
     5b0:	00c12983          	lw	s3,12(sp)
     5b4:	00812a03          	lw	s4,8(sp)
     5b8:	00412a83          	lw	s5,4(sp)
     5bc:	00012b03          	lw	s6,0(sp)
     5c0:	02010113          	addi	sp,sp,32
     5c4:	00008067          	ret
     5c8:	00004517          	auipc	a0,0x4
     5cc:	34850513          	addi	a0,a0,840 # 4910 <__udivdi3+0xb8c>
     5d0:	72d020ef          	jal	ra,34fc <ee_printf>
     5d4:	00000413          	li	s0,0
     5d8:	fc5ff06f          	j	59c <core_list_insert_new+0xc4>
     5dc:	00004517          	auipc	a0,0x4
     5e0:	31c50513          	addi	a0,a0,796 # 48f8 <__udivdi3+0xb74>
     5e4:	719020ef          	jal	ra,34fc <ee_printf>
     5e8:	00000413          	li	s0,0
     5ec:	fb1ff06f          	j	59c <core_list_insert_new+0xc4>

000005f0 <core_list_find>:
     5f0:	00259703          	lh	a4,2(a1)
     5f4:	02074863          	bltz	a4,624 <core_list_find+0x34>
     5f8:	02050463          	beqz	a0,620 <core_list_find+0x30>
     5fc:	00452783          	lw	a5,4(a0)
     600:	00279783          	lh	a5,2(a5)
     604:	00e79a63          	bne	a5,a4,618 <core_list_find+0x28>
     608:	0500006f          	j	658 <core_list_find+0x68>
     60c:	00452783          	lw	a5,4(a0)
     610:	00279783          	lh	a5,2(a5)
     614:	00e78663          	beq	a5,a4,620 <core_list_find+0x30>
     618:	00052503          	lw	a0,0(a0)
     61c:	fe0518e3          	bnez	a0,60c <core_list_find+0x1c>
     620:	00008067          	ret
     624:	fe050ee3          	beqz	a0,620 <core_list_find+0x30>
     628:	00452783          	lw	a5,4(a0)
     62c:	00059703          	lh	a4,0(a1)
     630:	0007c783          	lbu	a5,0(a5)
     634:	00e79a63          	bne	a5,a4,648 <core_list_find+0x58>
     638:	0240006f          	j	65c <core_list_find+0x6c>
     63c:	00452783          	lw	a5,4(a0)
     640:	0007c783          	lbu	a5,0(a5)
     644:	00e78863          	beq	a5,a4,654 <core_list_find+0x64>
     648:	00052503          	lw	a0,0(a0)
     64c:	fe0518e3          	bnez	a0,63c <core_list_find+0x4c>
     650:	fd1ff06f          	j	620 <core_list_find+0x30>
     654:	00008067          	ret
     658:	00008067          	ret
     65c:	00008067          	ret

00000660 <core_list_mergesort>:
     660:	fb010113          	addi	sp,sp,-80
     664:	03a12023          	sw	s10,32(sp)
     668:	00050d13          	mv	s10,a0
     66c:	03712623          	sw	s7,44(sp)
     670:	00004517          	auipc	a0,0x4
     674:	30c50513          	addi	a0,a0,780 # 497c <__udivdi3+0xbf8>
     678:	00058b93          	mv	s7,a1
     67c:	000d0593          	mv	a1,s10
     680:	03412c23          	sw	s4,56(sp)
     684:	03512a23          	sw	s5,52(sp)
     688:	03612823          	sw	s6,48(sp)
     68c:	03912223          	sw	s9,36(sp)
     690:	04112623          	sw	ra,76(sp)
     694:	04812423          	sw	s0,72(sp)
     698:	04912223          	sw	s1,68(sp)
     69c:	05212023          	sw	s2,64(sp)
     6a0:	03312e23          	sw	s3,60(sp)
     6a4:	03812423          	sw	s8,40(sp)
     6a8:	01b12e23          	sw	s11,28(sp)
     6ac:	00060b13          	mv	s6,a2
     6b0:	00100c93          	li	s9,1
     6b4:	649020ef          	jal	ra,34fc <ee_printf>
     6b8:	000d0613          	mv	a2,s10
     6bc:	000c8593          	mv	a1,s9
     6c0:	00004517          	auipc	a0,0x4
     6c4:	2e050513          	addi	a0,a0,736 # 49a0 <__udivdi3+0xc1c>
     6c8:	fd818a13          	addi	s4,gp,-40 # 6828 <g_merge_select_log_count>
     6cc:	05f00a93          	li	s5,95
     6d0:	62d020ef          	jal	ra,34fc <ee_printf>
     6d4:	160d0463          	beqz	s10,83c <core_list_mergesort+0x1dc>
     6d8:	00012623          	sw	zero,12(sp)
     6dc:	00000913          	li	s2,0
     6e0:	00000993          	li	s3,0
     6e4:	00c12783          	lw	a5,12(sp)
     6e8:	000d0413          	mv	s0,s10
     6ec:	00000493          	li	s1,0
     6f0:	00178793          	addi	a5,a5,1
     6f4:	00f12623          	sw	a5,12(sp)
     6f8:	00042403          	lw	s0,0(s0)
     6fc:	00148493          	addi	s1,s1,1
     700:	00040463          	beqz	s0,708 <core_list_mergesort+0xa8>
     704:	fe9c9ae3          	bne	s9,s1,6f8 <core_list_mergesort+0x98>
     708:	000c8d93          	mv	s11,s9
     70c:	04048863          	beqz	s1,75c <core_list_mergesort+0xfc>
     710:	060d8863          	beqz	s11,780 <core_list_mergesort+0x120>
     714:	06040663          	beqz	s0,780 <core_list_mergesort+0x120>
     718:	000a2e03          	lw	t3,0(s4)
     71c:	004d2503          	lw	a0,4(s10)
     720:	00442583          	lw	a1,4(s0)
     724:	07caf663          	bgeu	s5,t3,790 <core_list_mergesort+0x130>
     728:	001e0e13          	addi	t3,t3,1
     72c:	fdc1ac23          	sw	t3,-40(gp) # 6828 <g_merge_select_log_count>
     730:	000b0613          	mv	a2,s6
     734:	000b80e7          	jalr	s7
     738:	00050c13          	mv	s8,a0
     73c:	05805263          	blez	s8,780 <core_list_mergesort+0x120>
     740:	00040793          	mv	a5,s0
     744:	00042403          	lw	s0,0(s0)
     748:	fffd8d93          	addi	s11,s11,-1
     74c:	02090463          	beqz	s2,774 <core_list_mergesort+0x114>
     750:	00f92023          	sw	a5,0(s2)
     754:	00078913          	mv	s2,a5
     758:	fa049ce3          	bnez	s1,710 <core_list_mergesort+0xb0>
     75c:	080d8863          	beqz	s11,7ec <core_list_mergesort+0x18c>
     760:	08040a63          	beqz	s0,7f4 <core_list_mergesort+0x194>
     764:	00040793          	mv	a5,s0
     768:	fffd8d93          	addi	s11,s11,-1
     76c:	00042403          	lw	s0,0(s0)
     770:	fe0910e3          	bnez	s2,750 <core_list_mergesort+0xf0>
     774:	00078993          	mv	s3,a5
     778:	00078913          	mv	s2,a5
     77c:	fddff06f          	j	758 <core_list_mergesort+0xf8>
     780:	000d0793          	mv	a5,s10
     784:	fff48493          	addi	s1,s1,-1
     788:	000d2d03          	lw	s10,0(s10)
     78c:	fc1ff06f          	j	74c <core_list_mergesort+0xec>
     790:	00050713          	mv	a4,a0
     794:	000d8893          	mv	a7,s11
     798:	00048813          	mv	a6,s1
     79c:	00058793          	mv	a5,a1
     7a0:	00040693          	mv	a3,s0
     7a4:	000e0593          	mv	a1,t3
     7a8:	000d0613          	mv	a2,s10
     7ac:	00004517          	auipc	a0,0x4
     7b0:	22850513          	addi	a0,a0,552 # 49d4 <__udivdi3+0xc50>
     7b4:	549020ef          	jal	ra,34fc <ee_printf>
     7b8:	000a2783          	lw	a5,0(s4)
     7bc:	00442583          	lw	a1,4(s0)
     7c0:	004d2503          	lw	a0,4(s10)
     7c4:	00178793          	addi	a5,a5,1
     7c8:	fcf1ac23          	sw	a5,-40(gp) # 6828 <g_merge_select_log_count>
     7cc:	000b0613          	mv	a2,s6
     7d0:	000b80e7          	jalr	s7
     7d4:	00050c13          	mv	s8,a0
     7d8:	00050593          	mv	a1,a0
     7dc:	00004517          	auipc	a0,0x4
     7e0:	25c50513          	addi	a0,a0,604 # 4a38 <__udivdi3+0xcb4>
     7e4:	519020ef          	jal	ra,34fc <ee_printf>
     7e8:	f55ff06f          	j	73c <core_list_mergesort+0xdc>
     7ec:	00040d13          	mv	s10,s0
     7f0:	ee041ae3          	bnez	s0,6e4 <core_list_mergesort+0x84>
     7f4:	00c12403          	lw	s0,12(sp)
     7f8:	00092023          	sw	zero,0(s2)
     7fc:	00098693          	mv	a3,s3
     800:	00040613          	mv	a2,s0
     804:	000c8593          	mv	a1,s9
     808:	00004517          	auipc	a0,0x4
     80c:	25450513          	addi	a0,a0,596 # 4a5c <__udivdi3+0xcd8>
     810:	4ed020ef          	jal	ra,34fc <ee_printf>
     814:	00100793          	li	a5,1
     818:	02f40663          	beq	s0,a5,844 <core_list_mergesort+0x1e4>
     81c:	00098d13          	mv	s10,s3
     820:	001c9c93          	slli	s9,s9,0x1
     824:	000d0613          	mv	a2,s10
     828:	000c8593          	mv	a1,s9
     82c:	00004517          	auipc	a0,0x4
     830:	17450513          	addi	a0,a0,372 # 49a0 <__udivdi3+0xc1c>
     834:	4c9020ef          	jal	ra,34fc <ee_printf>
     838:	ea0d10e3          	bnez	s10,6d8 <core_list_mergesort+0x78>
     83c:	00002023          	sw	zero,0(zero) # 0 <_start>
     840:	00100073          	ebreak
     844:	00098593          	mv	a1,s3
     848:	00004517          	auipc	a0,0x4
     84c:	25450513          	addi	a0,a0,596 # 4a9c <__udivdi3+0xd18>
     850:	4ad020ef          	jal	ra,34fc <ee_printf>
     854:	04c12083          	lw	ra,76(sp)
     858:	04812403          	lw	s0,72(sp)
     85c:	00098513          	mv	a0,s3
     860:	04412483          	lw	s1,68(sp)
     864:	04012903          	lw	s2,64(sp)
     868:	03c12983          	lw	s3,60(sp)
     86c:	03812a03          	lw	s4,56(sp)
     870:	03412a83          	lw	s5,52(sp)
     874:	03012b03          	lw	s6,48(sp)
     878:	02c12b83          	lw	s7,44(sp)
     87c:	02812c03          	lw	s8,40(sp)
     880:	02412c83          	lw	s9,36(sp)
     884:	02012d03          	lw	s10,32(sp)
     888:	01c12d83          	lw	s11,28(sp)
     88c:	05010113          	addi	sp,sp,80
     890:	00008067          	ret

00000894 <core_bench_list>:
     894:	fc010113          	addi	sp,sp,-64
     898:	01812c23          	sw	s8,24(sp)
     89c:	00451c03          	lh	s8,4(a0)
     8a0:	02812c23          	sw	s0,56(sp)
     8a4:	03512223          	sw	s5,36(sp)
     8a8:	03612023          	sw	s6,32(sp)
     8ac:	02112e23          	sw	ra,60(sp)
     8b0:	02912a23          	sw	s1,52(sp)
     8b4:	03212823          	sw	s2,48(sp)
     8b8:	03312623          	sw	s3,44(sp)
     8bc:	03412423          	sw	s4,40(sp)
     8c0:	01712e23          	sw	s7,28(sp)
     8c4:	01912a23          	sw	s9,20(sp)
     8c8:	00011623          	sh	zero,12(sp)
     8cc:	00b11723          	sh	a1,14(sp)
     8d0:	00050b13          	mv	s6,a0
     8d4:	00058a93          	mv	s5,a1
     8d8:	02452403          	lw	s0,36(a0)
     8dc:	21805a63          	blez	s8,af0 <core_bench_list+0x25c>
     8e0:	00058c93          	mv	s9,a1
     8e4:	00000493          	li	s1,0
     8e8:	00000b93          	li	s7,0
     8ec:	00000993          	li	s3,0
     8f0:	00000913          	li	s2,0
     8f4:	00c10a13          	addi	s4,sp,12
     8f8:	0ff4f793          	andi	a5,s1,255
     8fc:	000a0593          	mv	a1,s4
     900:	00040513          	mv	a0,s0
     904:	00f11623          	sh	a5,12(sp)
     908:	ce9ff0ef          	jal	ra,5f0 <core_list_find>
     90c:	02040063          	beqz	s0,92c <core_bench_list+0x98>
     910:	00000713          	li	a4,0
     914:	0080006f          	j	91c <core_bench_list+0x88>
     918:	00078413          	mv	s0,a5
     91c:	00042783          	lw	a5,0(s0)
     920:	00e42023          	sw	a4,0(s0)
     924:	00040713          	mv	a4,s0
     928:	fe0798e3          	bnez	a5,918 <core_bench_list+0x84>
     92c:	06050a63          	beqz	a0,9a0 <core_bench_list+0x10c>
     930:	00452783          	lw	a5,4(a0)
     934:	00198993          	addi	s3,s3,1
     938:	01099993          	slli	s3,s3,0x10
     93c:	00079783          	lh	a5,0(a5)
     940:	0109d993          	srli	s3,s3,0x10
     944:	0017f713          	andi	a4,a5,1
     948:	00070c63          	beqz	a4,960 <core_bench_list+0xcc>
     94c:	4097d793          	srai	a5,a5,0x9
     950:	0017f793          	andi	a5,a5,1
     954:	00f90933          	add	s2,s2,a5
     958:	01091913          	slli	s2,s2,0x10
     95c:	01095913          	srli	s2,s2,0x10
     960:	00052783          	lw	a5,0(a0)
     964:	00078c63          	beqz	a5,97c <core_bench_list+0xe8>
     968:	0007a703          	lw	a4,0(a5)
     96c:	00e52023          	sw	a4,0(a0)
     970:	00042703          	lw	a4,0(s0)
     974:	00e7a023          	sw	a4,0(a5)
     978:	00f42023          	sw	a5,0(s0)
     97c:	000cc663          	bltz	s9,988 <core_bench_list+0xf4>
     980:	001c8c93          	addi	s9,s9,1
     984:	01911723          	sh	s9,14(sp)
     988:	00148493          	addi	s1,s1,1
     98c:	01049493          	slli	s1,s1,0x10
     990:	4104d493          	srai	s1,s1,0x10
     994:	029c0c63          	beq	s8,s1,9cc <core_bench_list+0x138>
     998:	00e11c83          	lh	s9,14(sp)
     99c:	f5dff06f          	j	8f8 <core_bench_list+0x64>
     9a0:	00042783          	lw	a5,0(s0)
     9a4:	001b8b93          	addi	s7,s7,1
     9a8:	010b9b93          	slli	s7,s7,0x10
     9ac:	0047a783          	lw	a5,4(a5)
     9b0:	010bdb93          	srli	s7,s7,0x10
     9b4:	00178783          	lb	a5,1(a5)
     9b8:	0017f793          	andi	a5,a5,1
     9bc:	00f90933          	add	s2,s2,a5
     9c0:	01091913          	slli	s2,s2,0x10
     9c4:	01095913          	srli	s2,s2,0x10
     9c8:	fb5ff06f          	j	97c <core_bench_list+0xe8>
     9cc:	00299493          	slli	s1,s3,0x2
     9d0:	417484b3          	sub	s1,s1,s7
     9d4:	009904b3          	add	s1,s2,s1
     9d8:	01049493          	slli	s1,s1,0x10
     9dc:	0104d493          	srli	s1,s1,0x10
     9e0:	01505e63          	blez	s5,9fc <core_bench_list+0x168>
     9e4:	00040513          	mv	a0,s0
     9e8:	000b0613          	mv	a2,s6
     9ec:	00000597          	auipc	a1,0x0
     9f0:	9d458593          	addi	a1,a1,-1580 # 3c0 <cmp_complex>
     9f4:	c6dff0ef          	jal	ra,660 <core_list_mergesort>
     9f8:	00050413          	mv	s0,a0
     9fc:	00042783          	lw	a5,0(s0)
     a00:	000a0593          	mv	a1,s4
     a04:	00040513          	mv	a0,s0
     a08:	0007a983          	lw	s3,0(a5)
     a0c:	0047aa03          	lw	s4,4(a5)
     a10:	0049a683          	lw	a3,4(s3)
     a14:	0009a703          	lw	a4,0(s3)
     a18:	00d7a223          	sw	a3,4(a5)
     a1c:	0149a223          	sw	s4,4(s3)
     a20:	00e7a023          	sw	a4,0(a5)
     a24:	0009a023          	sw	zero,0(s3)
     a28:	bc9ff0ef          	jal	ra,5f0 <core_list_find>
     a2c:	00050913          	mv	s2,a0
     a30:	0a050a63          	beqz	a0,ae4 <core_bench_list+0x250>
     a34:	00442783          	lw	a5,4(s0)
     a38:	00048593          	mv	a1,s1
     a3c:	00079503          	lh	a0,0(a5)
     a40:	664020ef          	jal	ra,30a4 <crc16>
     a44:	00092903          	lw	s2,0(s2)
     a48:	00050493          	mv	s1,a0
     a4c:	fe0914e3          	bnez	s2,a34 <core_bench_list+0x1a0>
     a50:	00042903          	lw	s2,0(s0)
     a54:	0049aa03          	lw	s4,4(s3)
     a58:	00492703          	lw	a4,4(s2)
     a5c:	00092783          	lw	a5,0(s2)
     a60:	00040513          	mv	a0,s0
     a64:	00e9a223          	sw	a4,4(s3)
     a68:	01492223          	sw	s4,4(s2)
     a6c:	00f9a023          	sw	a5,0(s3)
     a70:	01392023          	sw	s3,0(s2)
     a74:	00000613          	li	a2,0
     a78:	fffff597          	auipc	a1,0xfffff
     a7c:	5bc58593          	addi	a1,a1,1468 # 34 <cmp_idx>
     a80:	be1ff0ef          	jal	ra,660 <core_list_mergesort>
     a84:	00052403          	lw	s0,0(a0)
     a88:	00050913          	mv	s2,a0
     a8c:	02040063          	beqz	s0,aac <core_bench_list+0x218>
     a90:	00492783          	lw	a5,4(s2)
     a94:	00048593          	mv	a1,s1
     a98:	00079503          	lh	a0,0(a5)
     a9c:	608020ef          	jal	ra,30a4 <crc16>
     aa0:	00042403          	lw	s0,0(s0)
     aa4:	00050493          	mv	s1,a0
     aa8:	fe0414e3          	bnez	s0,a90 <core_bench_list+0x1fc>
     aac:	03c12083          	lw	ra,60(sp)
     ab0:	03812403          	lw	s0,56(sp)
     ab4:	00048513          	mv	a0,s1
     ab8:	03012903          	lw	s2,48(sp)
     abc:	03412483          	lw	s1,52(sp)
     ac0:	02c12983          	lw	s3,44(sp)
     ac4:	02812a03          	lw	s4,40(sp)
     ac8:	02412a83          	lw	s5,36(sp)
     acc:	02012b03          	lw	s6,32(sp)
     ad0:	01c12b83          	lw	s7,28(sp)
     ad4:	01812c03          	lw	s8,24(sp)
     ad8:	01412c83          	lw	s9,20(sp)
     adc:	04010113          	addi	sp,sp,64
     ae0:	00008067          	ret
     ae4:	00042903          	lw	s2,0(s0)
     ae8:	f40916e3          	bnez	s2,a34 <core_bench_list+0x1a0>
     aec:	f6dff06f          	j	a58 <core_bench_list+0x1c4>
     af0:	00000493          	li	s1,0
     af4:	00c10a13          	addi	s4,sp,12
     af8:	ee9ff06f          	j	9e0 <core_bench_list+0x14c>

00000afc <core_list_init>:
     afc:	fa010113          	addi	sp,sp,-96
     b00:	05412423          	sw	s4,72(sp)
     b04:	01061a13          	slli	s4,a2,0x10
     b08:	05312623          	sw	s3,76(sp)
     b0c:	010a5a13          	srli	s4,s4,0x10
     b10:	00050993          	mv	s3,a0
     b14:	00800713          	li	a4,8
     b18:	000a0693          	mv	a3,s4
     b1c:	00400793          	li	a5,4
     b20:	00058613          	mv	a2,a1
     b24:	00b12623          	sw	a1,12(sp)
     b28:	00004517          	auipc	a0,0x4
     b2c:	95050513          	addi	a0,a0,-1712 # 4478 <__udivdi3+0x6f4>
     b30:	00098593          	mv	a1,s3
     b34:	04112e23          	sw	ra,92(sp)
     b38:	04812c23          	sw	s0,88(sp)
     b3c:	04912a23          	sw	s1,84(sp)
     b40:	05212823          	sw	s2,80(sp)
     b44:	05512223          	sw	s5,68(sp)
     b48:	05612023          	sw	s6,64(sp)
     b4c:	03712e23          	sw	s7,60(sp)
     b50:	03812c23          	sw	s8,56(sp)
     b54:	03912a23          	sw	s9,52(sp)
     b58:	03a12823          	sw	s10,48(sp)
     b5c:	03b12623          	sw	s11,44(sp)
     b60:	19d020ef          	jal	ra,34fc <ee_printf>
     b64:	01400593          	li	a1,20
     b68:	00004517          	auipc	a0,0x4
     b6c:	96050513          	addi	a0,a0,-1696 # 44c8 <__udivdi3+0x744>
     b70:	18d020ef          	jal	ra,34fc <ee_printf>
     b74:	01400613          	li	a2,20
     b78:	00098593          	mv	a1,s3
     b7c:	00004517          	auipc	a0,0x4
     b80:	96c50513          	addi	a0,a0,-1684 # 44e8 <__udivdi3+0x764>
     b84:	179020ef          	jal	ra,34fc <ee_printf>
     b88:	01400793          	li	a5,20
     b8c:	02f9d7b3          	divu	a5,s3,a5
     b90:	00004517          	auipc	a0,0x4
     b94:	98850513          	addi	a0,a0,-1656 # 4518 <__udivdi3+0x794>
     b98:	ffe78413          	addi	s0,a5,-2
     b9c:	00040593          	mv	a1,s0
     ba0:	00f12423          	sw	a5,8(sp)
     ba4:	159020ef          	jal	ra,34fc <ee_printf>
     ba8:	00c12483          	lw	s1,12(sp)
     bac:	00341913          	slli	s2,s0,0x3
     bb0:	00241a93          	slli	s5,s0,0x2
     bb4:	01248933          	add	s2,s1,s2
     bb8:	01590ab3          	add	s5,s2,s5
     bbc:	000a8693          	mv	a3,s5
     bc0:	00090613          	mv	a2,s2
     bc4:	00048713          	mv	a4,s1
     bc8:	00090593          	mv	a1,s2
     bcc:	00004517          	auipc	a0,0x4
     bd0:	96c50513          	addi	a0,a0,-1684 # 4538 <__udivdi3+0x7b4>
     bd4:	01212c23          	sw	s2,24(sp)
     bd8:	125020ef          	jal	ra,34fc <ee_printf>
     bdc:	00004517          	auipc	a0,0x4
     be0:	9a450513          	addi	a0,a0,-1628 # 4580 <__udivdi3+0x7fc>
     be4:	119020ef          	jal	ra,34fc <ee_printf>
     be8:	00004517          	auipc	a0,0x4
     bec:	9b050513          	addi	a0,a0,-1616 # 4598 <__udivdi3+0x814>
     bf0:	0004a023          	sw	zero,0(s1)
     bf4:	109020ef          	jal	ra,34fc <ee_printf>
     bf8:	01812783          	lw	a5,24(sp)
     bfc:	00004517          	auipc	a0,0x4
     c00:	9b450513          	addi	a0,a0,-1612 # 45b0 <__udivdi3+0x82c>
     c04:	00078593          	mv	a1,a5
     c08:	00f4a223          	sw	a5,4(s1)
     c0c:	0f1020ef          	jal	ra,34fc <ee_printf>
     c10:	0044a783          	lw	a5,4(s1)
     c14:	00004517          	auipc	a0,0x4
     c18:	9c050513          	addi	a0,a0,-1600 # 45d4 <__udivdi3+0x850>
     c1c:	00079123          	sh	zero,2(a5)
     c20:	0dd020ef          	jal	ra,34fc <ee_printf>
     c24:	0044a703          	lw	a4,4(s1)
     c28:	ffff87b7          	lui	a5,0xffff8
     c2c:	08078793          	addi	a5,a5,128 # ffff8080 <__stack_top+0xfffe8080>
     c30:	00f71023          	sh	a5,0(a4)
     c34:	00004517          	auipc	a0,0x4
     c38:	9b850513          	addi	a0,a0,-1608 # 45ec <__udivdi3+0x868>
     c3c:	0c1020ef          	jal	ra,34fc <ee_printf>
     c40:	01812783          	lw	a5,24(sp)
     c44:	00c12703          	lw	a4,12(sp)
     c48:	00004517          	auipc	a0,0x4
     c4c:	9bc50513          	addi	a0,a0,-1604 # 4604 <__udivdi3+0x880>
     c50:	00478793          	addi	a5,a5,4
     c54:	00870713          	addi	a4,a4,8
     c58:	00078613          	mv	a2,a5
     c5c:	00f12c23          	sw	a5,24(sp)
     c60:	800007b7          	lui	a5,0x80000
     c64:	00070593          	mv	a1,a4
     c68:	fff7c793          	not	a5,a5
     c6c:	00e12623          	sw	a4,12(sp)
     c70:	00f12e23          	sw	a5,28(sp)
     c74:	089020ef          	jal	ra,34fc <ee_printf>
     c78:	01810693          	addi	a3,sp,24
     c7c:	00c10613          	addi	a2,sp,12
     c80:	01c10593          	addi	a1,sp,28
     c84:	000a8793          	mv	a5,s5
     c88:	00090713          	mv	a4,s2
     c8c:	00048513          	mv	a0,s1
     c90:	849ff0ef          	jal	ra,4d8 <core_list_insert_new>
     c94:	01812683          	lw	a3,24(sp)
     c98:	00c12603          	lw	a2,12(sp)
     c9c:	00050b13          	mv	s6,a0
     ca0:	00050593          	mv	a1,a0
     ca4:	00004517          	auipc	a0,0x4
     ca8:	99450513          	addi	a0,a0,-1644 # 4638 <__udivdi3+0x8b4>
     cac:	051020ef          	jal	ra,34fc <ee_printf>
     cb0:	1c0b0663          	beqz	s6,e7c <core_list_init+0x380>
     cb4:	00040593          	mv	a1,s0
     cb8:	00004517          	auipc	a0,0x4
     cbc:	9c050513          	addi	a0,a0,-1600 # 4678 <__udivdi3+0x8f4>
     cc0:	03d020ef          	jal	ra,34fc <ee_printf>
     cc4:	00000c93          	li	s9,0
     cc8:	08040a63          	beqz	s0,d5c <core_list_init+0x260>
     ccc:	00300b13          	li	s6,3
     cd0:	00004c17          	auipc	s8,0x4
     cd4:	b84c0c13          	addi	s8,s8,-1148 # 4854 <__udivdi3+0xad0>
     cd8:	00004b97          	auipc	s7,0x4
     cdc:	9c4b8b93          	addi	s7,s7,-1596 # 469c <__udivdi3+0x918>
     ce0:	010c9793          	slli	a5,s9,0x10
     ce4:	0107d793          	srli	a5,a5,0x10
     ce8:	00fa4633          	xor	a2,s4,a5
     cec:	00361613          	slli	a2,a2,0x3
     cf0:	0077f793          	andi	a5,a5,7
     cf4:	07867613          	andi	a2,a2,120
     cf8:	00f66633          	or	a2,a2,a5
     cfc:	00861793          	slli	a5,a2,0x8
     d00:	00c7e7b3          	or	a5,a5,a2
     d04:	00f11e23          	sh	a5,28(sp)
     d08:	219b7a63          	bgeu	s6,s9,f1c <core_list_init+0x420>
     d0c:	001c8d13          	addi	s10,s9,1
     d10:	1c8d0663          	beq	s10,s0,edc <core_list_init+0x3e0>
     d14:	007d7993          	andi	s3,s10,7
     d18:	1c098263          	beqz	s3,edc <core_list_init+0x3e0>
     d1c:	000a8793          	mv	a5,s5
     d20:	00090713          	mv	a4,s2
     d24:	01810693          	addi	a3,sp,24
     d28:	00c10613          	addi	a2,sp,12
     d2c:	01c10593          	addi	a1,sp,28
     d30:	00048513          	mv	a0,s1
     d34:	fa4ff0ef          	jal	ra,4d8 <core_list_insert_new>
     d38:	00050d93          	mv	s11,a0
     d3c:	00099a63          	bnez	s3,d50 <core_list_init+0x254>
     d40:	000d8613          	mv	a2,s11
     d44:	000c8593          	mv	a1,s9
     d48:	000b8513          	mv	a0,s7
     d4c:	7b0020ef          	jal	ra,34fc <ee_printf>
     d50:	200d8263          	beqz	s11,f54 <core_list_init+0x458>
     d54:	001c8c93          	addi	s9,s9,1
     d58:	f99414e3          	bne	s0,s9,ce0 <core_list_init+0x1e4>
     d5c:	01812683          	lw	a3,24(sp)
     d60:	00c12603          	lw	a2,12(sp)
     d64:	000c8593          	mv	a1,s9
     d68:	00004517          	auipc	a0,0x4
     d6c:	98450513          	addi	a0,a0,-1660 # 46ec <__udivdi3+0x968>
     d70:	78c020ef          	jal	ra,34fc <ee_printf>
     d74:	0004aa83          	lw	s5,0(s1)
     d78:	00812783          	lw	a5,8(sp)
     d7c:	00004517          	auipc	a0,0x4
     d80:	9a850513          	addi	a0,a0,-1624 # 4724 <__udivdi3+0x9a0>
     d84:	000a8593          	mv	a1,s5
     d88:	00500b93          	li	s7,5
     d8c:	00378993          	addi	s3,a5,3 # 80000003 <__stack_top+0x7fff0003>
     d90:	76c020ef          	jal	ra,34fc <ee_printf>
     d94:	03745bb3          	divu	s7,s0,s7
     d98:	00004c37          	lui	s8,0x4
     d9c:	00100d93          	li	s11,1
     da0:	00000913          	li	s2,0
     da4:	00300b13          	li	s6,3
     da8:	00004d17          	auipc	s10,0x4
     dac:	9a0d0d13          	addi	s10,s10,-1632 # 4748 <__udivdi3+0x9c4>
     db0:	fffc0c13          	addi	s8,s8,-1 # 3fff <__udivdi3+0x27b>
     db4:	00004c97          	auipc	s9,0x4
     db8:	9d8c8c93          	addi	s9,s9,-1576 # 478c <__udivdi3+0xa08>
     dbc:	000aa683          	lw	a3,0(s5)
     dc0:	06068863          	beqz	a3,e30 <core_list_init+0x334>
     dc4:	012b7663          	bgeu	s6,s2,dd0 <core_list_init+0x2d4>
     dc8:	00797793          	andi	a5,s2,7
     dcc:	00079c63          	bnez	a5,de4 <core_list_init+0x2e8>
     dd0:	000d8713          	mv	a4,s11
     dd4:	000a8613          	mv	a2,s5
     dd8:	00090593          	mv	a1,s2
     ddc:	000d0513          	mv	a0,s10
     de0:	71c020ef          	jal	ra,34fc <ee_printf>
     de4:	004aa703          	lw	a4,4(s5)
     de8:	0d7dfa63          	bgeu	s11,s7,ebc <core_list_init+0x3c0>
     dec:	01b71123          	sh	s11,2(a4)
     df0:	012b7663          	bgeu	s6,s2,dfc <core_list_init+0x300>
     df4:	00797793          	andi	a5,s2,7
     df8:	00079a63          	bnez	a5,e0c <core_list_init+0x310>
     dfc:	00275603          	lhu	a2,2(a4)
     e00:	00090593          	mv	a1,s2
     e04:	000c8513          	mv	a0,s9
     e08:	6f4020ef          	jal	ra,34fc <ee_printf>
     e0c:	00190913          	addi	s2,s2,1
     e10:	000aaa83          	lw	s5,0(s5)
     e14:	001d8d93          	addi	s11,s11,1
     e18:	fb3912e3          	bne	s2,s3,dbc <core_list_init+0x2c0>
     e1c:	00040613          	mv	a2,s0
     e20:	00090593          	mv	a1,s2
     e24:	00004517          	auipc	a0,0x4
     e28:	99450513          	addi	a0,a0,-1644 # 47b8 <__udivdi3+0xa34>
     e2c:	6d0020ef          	jal	ra,34fc <ee_printf>
     e30:	000a8613          	mv	a2,s5
     e34:	00090593          	mv	a1,s2
     e38:	00004517          	auipc	a0,0x4
     e3c:	9b050513          	addi	a0,a0,-1616 # 47e8 <__udivdi3+0xa64>
     e40:	6bc020ef          	jal	ra,34fc <ee_printf>
     e44:	00048593          	mv	a1,s1
     e48:	00004517          	auipc	a0,0x4
     e4c:	9cc50513          	addi	a0,a0,-1588 # 4814 <__udivdi3+0xa90>
     e50:	6ac020ef          	jal	ra,34fc <ee_printf>
     e54:	fffff597          	auipc	a1,0xfffff
     e58:	1e058593          	addi	a1,a1,480 # 34 <cmp_idx>
     e5c:	00048513          	mv	a0,s1
     e60:	00000613          	li	a2,0
     e64:	ffcff0ef          	jal	ra,660 <core_list_mergesort>
     e68:	00050493          	mv	s1,a0
     e6c:	00050593          	mv	a1,a0
     e70:	00004517          	auipc	a0,0x4
     e74:	9c450513          	addi	a0,a0,-1596 # 4834 <__udivdi3+0xab0>
     e78:	684020ef          	jal	ra,34fc <ee_printf>
     e7c:	05c12083          	lw	ra,92(sp)
     e80:	05812403          	lw	s0,88(sp)
     e84:	00048513          	mv	a0,s1
     e88:	05012903          	lw	s2,80(sp)
     e8c:	05412483          	lw	s1,84(sp)
     e90:	04c12983          	lw	s3,76(sp)
     e94:	04812a03          	lw	s4,72(sp)
     e98:	04412a83          	lw	s5,68(sp)
     e9c:	04012b03          	lw	s6,64(sp)
     ea0:	03c12b83          	lw	s7,60(sp)
     ea4:	03812c03          	lw	s8,56(sp)
     ea8:	03412c83          	lw	s9,52(sp)
     eac:	03012d03          	lw	s10,48(sp)
     eb0:	02c12d83          	lw	s11,44(sp)
     eb4:	06010113          	addi	sp,sp,96
     eb8:	00008067          	ret
     ebc:	00891793          	slli	a5,s2,0x8
     ec0:	20078793          	addi	a5,a5,512
     ec4:	7007f793          	andi	a5,a5,1792
     ec8:	01ba46b3          	xor	a3,s4,s11
     ecc:	00d7e7b3          	or	a5,a5,a3
     ed0:	0187f7b3          	and	a5,a5,s8
     ed4:	00f71123          	sh	a5,2(a4)
     ed8:	f19ff06f          	j	df0 <core_list_init+0x2f4>
     edc:	01812703          	lw	a4,24(sp)
     ee0:	00c12683          	lw	a3,12(sp)
     ee4:	000c8593          	mv	a1,s9
     ee8:	000c0513          	mv	a0,s8
     eec:	610020ef          	jal	ra,34fc <ee_printf>
     ef0:	000a8793          	mv	a5,s5
     ef4:	00090713          	mv	a4,s2
     ef8:	01810693          	addi	a3,sp,24
     efc:	00c10613          	addi	a2,sp,12
     f00:	01c10593          	addi	a1,sp,28
     f04:	00048513          	mv	a0,s1
     f08:	dd0ff0ef          	jal	ra,4d8 <core_list_insert_new>
     f0c:	00050d93          	mv	s11,a0
     f10:	007d7993          	andi	s3,s10,7
     f14:	e3a414e3          	bne	s0,s10,d3c <core_list_init+0x240>
     f18:	e29ff06f          	j	d40 <core_list_init+0x244>
     f1c:	01812703          	lw	a4,24(sp)
     f20:	00c12683          	lw	a3,12(sp)
     f24:	000c8593          	mv	a1,s9
     f28:	000c0513          	mv	a0,s8
     f2c:	5d0020ef          	jal	ra,34fc <ee_printf>
     f30:	000a8793          	mv	a5,s5
     f34:	00090713          	mv	a4,s2
     f38:	01810693          	addi	a3,sp,24
     f3c:	00c10613          	addi	a2,sp,12
     f40:	01c10593          	addi	a1,sp,28
     f44:	00048513          	mv	a0,s1
     f48:	d90ff0ef          	jal	ra,4d8 <core_list_insert_new>
     f4c:	00050d93          	mv	s11,a0
     f50:	df1ff06f          	j	d40 <core_list_init+0x244>
     f54:	000c8593          	mv	a1,s9
     f58:	00003517          	auipc	a0,0x3
     f5c:	77450513          	addi	a0,a0,1908 # 46cc <__udivdi3+0x948>
     f60:	59c020ef          	jal	ra,34fc <ee_printf>
     f64:	df9ff06f          	j	d5c <core_list_init+0x260>

00000f68 <iterate>:
     f68:	fd010113          	addi	sp,sp,-48
     f6c:	03212023          	sw	s2,32(sp)
     f70:	01c52903          	lw	s2,28(a0)
     f74:	02812423          	sw	s0,40(sp)
     f78:	02112623          	sw	ra,44(sp)
     f7c:	02912223          	sw	s1,36(sp)
     f80:	01312e23          	sw	s3,28(sp)
     f84:	01412c23          	sw	s4,24(sp)
     f88:	01512a23          	sw	s5,20(sp)
     f8c:	01612823          	sw	s6,16(sp)
     f90:	01712623          	sw	s7,12(sp)
     f94:	01812423          	sw	s8,8(sp)
     f98:	01912223          	sw	s9,4(sp)
     f9c:	01a12023          	sw	s10,0(sp)
     fa0:	00050413          	mv	s0,a0
     fa4:	02052c23          	sw	zero,56(a0)
     fa8:	02052e23          	sw	zero,60(a0)
     fac:	00090593          	mv	a1,s2
     fb0:	00004517          	auipc	a0,0x4
     fb4:	b1050513          	addi	a0,a0,-1264 # 4ac0 <__udivdi3+0xd3c>
     fb8:	544020ef          	jal	ra,34fc <ee_printf>
     fbc:	10090c63          	beqz	s2,10d4 <iterate+0x16c>
     fc0:	00000793          	li	a5,0
     fc4:	00295c93          	srli	s9,s2,0x2
     fc8:	00400a13          	li	s4,4
     fcc:	00004997          	auipc	s3,0x4
     fd0:	bc098993          	addi	s3,s3,-1088 # 4b8c <__udivdi3+0xe08>
     fd4:	00004c17          	auipc	s8,0x4
     fd8:	b30c0c13          	addi	s8,s8,-1232 # 4b04 <__udivdi3+0xd80>
     fdc:	00004b97          	auipc	s7,0x4
     fe0:	b44b8b93          	addi	s7,s7,-1212 # 4b20 <__udivdi3+0xd9c>
     fe4:	00004b17          	auipc	s6,0x4
     fe8:	b64b0b13          	addi	s6,s6,-1180 # 4b48 <__udivdi3+0xdc4>
     fec:	00004a97          	auipc	s5,0x4
     ff0:	b78a8a93          	addi	s5,s5,-1160 # 4b64 <__udivdi3+0xde0>
     ff4:	00100593          	li	a1,1
     ff8:	00040513          	mv	a0,s0
     ffc:	00178493          	addi	s1,a5,1
    1000:	04078863          	beqz	a5,1050 <iterate+0xe8>
    1004:	891ff0ef          	jal	ra,894 <core_bench_list>
    1008:	03845583          	lhu	a1,56(s0)
    100c:	7e5010ef          	jal	ra,2ff0 <crcu16>
    1010:	02a41c23          	sh	a0,56(s0)
    1014:	fff00593          	li	a1,-1
    1018:	00040513          	mv	a0,s0
    101c:	879ff0ef          	jal	ra,894 <core_bench_list>
    1020:	03845583          	lhu	a1,56(s0)
    1024:	7cd010ef          	jal	ra,2ff0 <crcu16>
    1028:	02a41c23          	sh	a0,56(s0)
    102c:	092a7863          	bgeu	s4,s2,10bc <iterate+0x154>
    1030:	08990663          	beq	s2,s1,10bc <iterate+0x154>
    1034:	0394f7b3          	remu	a5,s1,s9
    1038:	08078263          	beqz	a5,10bc <iterate+0x154>
    103c:	00048793          	mv	a5,s1
    1040:	00100593          	li	a1,1
    1044:	00040513          	mv	a0,s0
    1048:	00178493          	addi	s1,a5,1
    104c:	fa079ce3          	bnez	a5,1004 <iterate+0x9c>
    1050:	000c0513          	mv	a0,s8
    1054:	4a8020ef          	jal	ra,34fc <ee_printf>
    1058:	00100593          	li	a1,1
    105c:	00040513          	mv	a0,s0
    1060:	835ff0ef          	jal	ra,894 <core_bench_list>
    1064:	00050d13          	mv	s10,a0
    1068:	00050593          	mv	a1,a0
    106c:	000b8513          	mv	a0,s7
    1070:	48c020ef          	jal	ra,34fc <ee_printf>
    1074:	03845583          	lhu	a1,56(s0)
    1078:	000d0513          	mv	a0,s10
    107c:	775010ef          	jal	ra,2ff0 <crcu16>
    1080:	02a41c23          	sh	a0,56(s0)
    1084:	000b0513          	mv	a0,s6
    1088:	474020ef          	jal	ra,34fc <ee_printf>
    108c:	fff00593          	li	a1,-1
    1090:	00040513          	mv	a0,s0
    1094:	801ff0ef          	jal	ra,894 <core_bench_list>
    1098:	00050593          	mv	a1,a0
    109c:	00050d13          	mv	s10,a0
    10a0:	000a8513          	mv	a0,s5
    10a4:	458020ef          	jal	ra,34fc <ee_printf>
    10a8:	03845583          	lhu	a1,56(s0)
    10ac:	000d0513          	mv	a0,s10
    10b0:	741010ef          	jal	ra,2ff0 <crcu16>
    10b4:	02a41c23          	sh	a0,56(s0)
    10b8:	02a41d23          	sh	a0,58(s0)
    10bc:	00050693          	mv	a3,a0
    10c0:	00090613          	mv	a2,s2
    10c4:	00048593          	mv	a1,s1
    10c8:	00098513          	mv	a0,s3
    10cc:	430020ef          	jal	ra,34fc <ee_printf>
    10d0:	f69916e3          	bne	s2,s1,103c <iterate+0xd4>
    10d4:	03845583          	lhu	a1,56(s0)
    10d8:	00004517          	auipc	a0,0x4
    10dc:	a0c50513          	addi	a0,a0,-1524 # 4ae4 <__udivdi3+0xd60>
    10e0:	41c020ef          	jal	ra,34fc <ee_printf>
    10e4:	02c12083          	lw	ra,44(sp)
    10e8:	02812403          	lw	s0,40(sp)
    10ec:	02412483          	lw	s1,36(sp)
    10f0:	02012903          	lw	s2,32(sp)
    10f4:	01c12983          	lw	s3,28(sp)
    10f8:	01812a03          	lw	s4,24(sp)
    10fc:	01412a83          	lw	s5,20(sp)
    1100:	01012b03          	lw	s6,16(sp)
    1104:	00c12b83          	lw	s7,12(sp)
    1108:	00812c03          	lw	s8,8(sp)
    110c:	00412c83          	lw	s9,4(sp)
    1110:	00012d03          	lw	s10,0(sp)
    1114:	00000513          	li	a0,0
    1118:	03010113          	addi	sp,sp,48
    111c:	00008067          	ret

00001120 <main>:
    1120:	f8010113          	addi	sp,sp,-128
    1124:	00810613          	addi	a2,sp,8
    1128:	00410593          	addi	a1,sp,4
    112c:	04e10513          	addi	a0,sp,78
    1130:	06112e23          	sw	ra,124(sp)
    1134:	06812c23          	sw	s0,120(sp)
    1138:	06912a23          	sw	s1,116(sp)
    113c:	07212823          	sw	s2,112(sp)
    1140:	07312623          	sw	s3,108(sp)
    1144:	07412423          	sw	s4,104(sp)
    1148:	07512223          	sw	s5,100(sp)
    114c:	07612023          	sw	s6,96(sp)
    1150:	05712e23          	sw	s7,92(sp)
    1154:	05812c23          	sw	s8,88(sp)
    1158:	05912a23          	sw	s9,84(sp)
    115c:	05a12823          	sw	s10,80(sp)
    1160:	00012223          	sw	zero,4(sp)
    1164:	79d010ef          	jal	ra,3100 <portable_init>
    1168:	00004517          	auipc	a0,0x4
    116c:	a5850513          	addi	a0,a0,-1448 # 4bc0 <list_known_crc+0xc>
    1170:	38c020ef          	jal	ra,34fc <ee_printf>
    1174:	00100513          	li	a0,1
    1178:	609010ef          	jal	ra,2f80 <get_seed_32>
    117c:	00a11623          	sh	a0,12(sp)
    1180:	00200513          	li	a0,2
    1184:	5fd010ef          	jal	ra,2f80 <get_seed_32>
    1188:	00a11723          	sh	a0,14(sp)
    118c:	00300513          	li	a0,3
    1190:	5f1010ef          	jal	ra,2f80 <get_seed_32>
    1194:	00a11823          	sh	a0,16(sp)
    1198:	00400513          	li	a0,4
    119c:	5e5010ef          	jal	ra,2f80 <get_seed_32>
    11a0:	02a12423          	sw	a0,40(sp)
    11a4:	00500513          	li	a0,5
    11a8:	5d9010ef          	jal	ra,2f80 <get_seed_32>
    11ac:	00c11583          	lh	a1,12(sp)
    11b0:	02812703          	lw	a4,40(sp)
    11b4:	01011683          	lh	a3,16(sp)
    11b8:	00e11603          	lh	a2,14(sp)
    11bc:	00050813          	mv	a6,a0
    11c0:	00050793          	mv	a5,a0
    11c4:	00004517          	auipc	a0,0x4
    11c8:	a1c50513          	addi	a0,a0,-1508 # 4be0 <list_known_crc+0x2c>
    11cc:	03012623          	sw	a6,44(sp)
    11d0:	32c020ef          	jal	ra,34fc <ee_printf>
    11d4:	02c12583          	lw	a1,44(sp)
    11d8:	16058a63          	beqz	a1,134c <main+0x22c>
    11dc:	00004517          	auipc	a0,0x4
    11e0:	a8050513          	addi	a0,a0,-1408 # 4c5c <list_known_crc+0xa8>
    11e4:	318020ef          	jal	ra,34fc <ee_printf>
    11e8:	00c12783          	lw	a5,12(sp)
    11ec:	12079a63          	bnez	a5,1320 <main+0x200>
    11f0:	01011683          	lh	a3,16(sp)
    11f4:	14068463          	beqz	a3,133c <main+0x21c>
    11f8:	00e11603          	lh	a2,14(sp)
    11fc:	00c11583          	lh	a1,12(sp)
    1200:	00004517          	auipc	a0,0x4
    1204:	a8050513          	addi	a0,a0,-1408 # 4c80 <list_known_crc+0xcc>
    1208:	00005417          	auipc	s0,0x5
    120c:	e4840413          	addi	s0,s0,-440 # 6050 <static_memblk>
    1210:	2ec020ef          	jal	ra,34fc <ee_printf>
    1214:	7d000613          	li	a2,2000
    1218:	00040593          	mv	a1,s0
    121c:	00004517          	auipc	a0,0x4
    1220:	aa050513          	addi	a0,a0,-1376 # 4cbc <list_known_crc+0x108>
    1224:	2d8020ef          	jal	ra,34fc <ee_printf>
    1228:	00000693          	li	a3,0
    122c:	7d000793          	li	a5,2000
    1230:	7d000613          	li	a2,2000
    1234:	00040593          	mv	a1,s0
    1238:	00004517          	auipc	a0,0x4
    123c:	abc50513          	addi	a0,a0,-1348 # 4cf4 <list_known_crc+0x140>
    1240:	02f12223          	sw	a5,36(sp)
    1244:	00812a23          	sw	s0,20(sp)
    1248:	04011623          	sh	zero,76(sp)
    124c:	2b0020ef          	jal	ra,34fc <ee_printf>
    1250:	02c12583          	lw	a1,44(sp)
    1254:	00300613          	li	a2,3
    1258:	00004517          	auipc	a0,0x4
    125c:	ad850513          	addi	a0,a0,-1320 # 4d30 <list_known_crc+0x17c>
    1260:	29c020ef          	jal	ra,34fc <ee_printf>
    1264:	02c12683          	lw	a3,44(sp)
    1268:	00000493          	li	s1,0
    126c:	00000913          	li	s2,0
    1270:	00100a93          	li	s5,1
    1274:	00004a17          	auipc	s4,0x4
    1278:	af4a0a13          	addi	s4,s4,-1292 # 4d68 <list_known_crc+0x1b4>
    127c:	00300993          	li	s3,3
    1280:	009a9433          	sll	s0,s5,s1
    1284:	00d476b3          	and	a3,s0,a3
    1288:	00048593          	mv	a1,s1
    128c:	00d036b3          	snez	a3,a3
    1290:	00040613          	mv	a2,s0
    1294:	00090713          	mv	a4,s2
    1298:	000a0513          	mv	a0,s4
    129c:	260020ef          	jal	ra,34fc <ee_printf>
    12a0:	02c12683          	lw	a3,44(sp)
    12a4:	00148493          	addi	s1,s1,1
    12a8:	00190793          	addi	a5,s2,1
    12ac:	0086f433          	and	s0,a3,s0
    12b0:	00040663          	beqz	s0,12bc <main+0x19c>
    12b4:	01079913          	slli	s2,a5,0x10
    12b8:	01095913          	srli	s2,s2,0x10
    12bc:	fd3492e3          	bne	s1,s3,1280 <main+0x160>
    12c0:	00090593          	mv	a1,s2
    12c4:	00004517          	auipc	a0,0x4
    12c8:	ae050513          	addi	a0,a0,-1312 # 4da4 <list_known_crc+0x1f0>
    12cc:	230020ef          	jal	ra,34fc <ee_printf>
    12d0:	08091e63          	bnez	s2,136c <main+0x24c>
    12d4:	02c12583          	lw	a1,44(sp)
    12d8:	00004517          	auipc	a0,0x4
    12dc:	af450513          	addi	a0,a0,-1292 # 4dcc <list_known_crc+0x218>
    12e0:	21c020ef          	jal	ra,34fc <ee_printf>
    12e4:	07c12083          	lw	ra,124(sp)
    12e8:	07812403          	lw	s0,120(sp)
    12ec:	07412483          	lw	s1,116(sp)
    12f0:	07012903          	lw	s2,112(sp)
    12f4:	06c12983          	lw	s3,108(sp)
    12f8:	06812a03          	lw	s4,104(sp)
    12fc:	06412a83          	lw	s5,100(sp)
    1300:	06012b03          	lw	s6,96(sp)
    1304:	05c12b83          	lw	s7,92(sp)
    1308:	05812c03          	lw	s8,88(sp)
    130c:	05412c83          	lw	s9,84(sp)
    1310:	05012d03          	lw	s10,80(sp)
    1314:	00000513          	li	a0,0
    1318:	08010113          	addi	sp,sp,128
    131c:	00008067          	ret
    1320:	00100713          	li	a4,1
    1324:	01011683          	lh	a3,16(sp)
    1328:	ece798e3          	bne	a5,a4,11f8 <main+0xd8>
    132c:	ec0696e3          	bnez	a3,11f8 <main+0xd8>
    1330:	341537b7          	lui	a5,0x34153
    1334:	41578793          	addi	a5,a5,1045 # 34153415 <__stack_top+0x34143415>
    1338:	00f12623          	sw	a5,12(sp)
    133c:	06600793          	li	a5,102
    1340:	00f11823          	sh	a5,16(sp)
    1344:	06600693          	li	a3,102
    1348:	eb1ff06f          	j	11f8 <main+0xd8>
    134c:	00700593          	li	a1,7
    1350:	00004517          	auipc	a0,0x4
    1354:	8e450513          	addi	a0,a0,-1820 # 4c34 <list_known_crc+0x80>
    1358:	1a4020ef          	jal	ra,34fc <ee_printf>
    135c:	00700793          	li	a5,7
    1360:	02f12623          	sw	a5,44(sp)
    1364:	00700593          	li	a1,7
    1368:	e75ff06f          	j	11dc <main+0xbc>
    136c:	02412583          	lw	a1,36(sp)
    1370:	00100693          	li	a3,1
    1374:	00090613          	mv	a2,s2
    1378:	00004517          	auipc	a0,0x4
    137c:	a8450513          	addi	a0,a0,-1404 # 4dfc <list_known_crc+0x248>
    1380:	17c020ef          	jal	ra,34fc <ee_printf>
    1384:	02412603          	lw	a2,36(sp)
    1388:	00000593          	li	a1,0
    138c:	00004517          	auipc	a0,0x4
    1390:	ab050513          	addi	a0,a0,-1360 # 4e3c <list_known_crc+0x288>
    1394:	168020ef          	jal	ra,34fc <ee_printf>
    1398:	02412783          	lw	a5,36(sp)
    139c:	00000593          	li	a1,0
    13a0:	00004517          	auipc	a0,0x4
    13a4:	ad050513          	addi	a0,a0,-1328 # 4e70 <list_known_crc+0x2bc>
    13a8:	0327d7b3          	divu	a5,a5,s2
    13ac:	00000493          	li	s1,0
    13b0:	00000413          	li	s0,0
    13b4:	00100b13          	li	s6,1
    13b8:	00004a17          	auipc	s4,0x4
    13bc:	b4ca0a13          	addi	s4,s4,-1204 # 4f04 <list_known_crc+0x350>
    13c0:	00004997          	auipc	s3,0x4
    13c4:	b7498993          	addi	s3,s3,-1164 # 4f34 <list_known_crc+0x380>
    13c8:	00300a93          	li	s5,3
    13cc:	00078613          	mv	a2,a5
    13d0:	02f12223          	sw	a5,36(sp)
    13d4:	128020ef          	jal	ra,34fc <ee_printf>
    13d8:	02412603          	lw	a2,36(sp)
    13dc:	00090593          	mv	a1,s2
    13e0:	7d000693          	li	a3,2000
    13e4:	00004517          	auipc	a0,0x4
    13e8:	abc50513          	addi	a0,a0,-1348 # 4ea0 <list_known_crc+0x2ec>
    13ec:	110020ef          	jal	ra,34fc <ee_printf>
    13f0:	02412583          	lw	a1,36(sp)
    13f4:	00004517          	auipc	a0,0x4
    13f8:	aec50513          	addi	a0,a0,-1300 # 4ee0 <list_known_crc+0x32c>
    13fc:	100020ef          	jal	ra,34fc <ee_printf>
    1400:	02c12783          	lw	a5,44(sp)
    1404:	009b16b3          	sll	a3,s6,s1
    1408:	00f6f7b3          	and	a5,a3,a5
    140c:	66079663          	bnez	a5,1a78 <main+0x958>
    1410:	00148493          	addi	s1,s1,1
    1414:	ff5496e3          	bne	s1,s5,1400 <main+0x2e0>
    1418:	00040593          	mv	a1,s0
    141c:	00004517          	auipc	a0,0x4
    1420:	b4850513          	addi	a0,a0,-1208 # 4f64 <list_known_crc+0x3b0>
    1424:	0d8020ef          	jal	ra,34fc <ee_printf>
    1428:	02c12783          	lw	a5,44(sp)
    142c:	0017f713          	andi	a4,a5,1
    1430:	60071663          	bnez	a4,1a3c <main+0x91c>
    1434:	0027f713          	andi	a4,a5,2
    1438:	5a071e63          	bnez	a4,19f4 <main+0x8d4>
    143c:	0047f793          	andi	a5,a5,4
    1440:	02078a63          	beqz	a5,1474 <main+0x354>
    1444:	00000593          	li	a1,0
    1448:	00004517          	auipc	a0,0x4
    144c:	bb850513          	addi	a0,a0,-1096 # 5000 <list_known_crc+0x44c>
    1450:	0ac020ef          	jal	ra,34fc <ee_printf>
    1454:	00c11583          	lh	a1,12(sp)
    1458:	02412503          	lw	a0,36(sp)
    145c:	02012603          	lw	a2,32(sp)
    1460:	390010ef          	jal	ra,27f0 <core_init_state>
    1464:	00000593          	li	a1,0
    1468:	00004517          	auipc	a0,0x4
    146c:	bb850513          	addi	a0,a0,-1096 # 5020 <list_known_crc+0x46c>
    1470:	08c020ef          	jal	ra,34fc <ee_printf>
    1474:	00004517          	auipc	a0,0x4
    1478:	bcc50513          	addi	a0,a0,-1076 # 5040 <list_known_crc+0x48c>
    147c:	080020ef          	jal	ra,34fc <ee_printf>
    1480:	02812583          	lw	a1,40(sp)
    1484:	64058463          	beqz	a1,1acc <main+0x9ac>
    1488:	00004517          	auipc	a0,0x4
    148c:	c6450513          	addi	a0,a0,-924 # 50ec <list_known_crc+0x538>
    1490:	06c020ef          	jal	ra,34fc <ee_printf>
    1494:	02812583          	lw	a1,40(sp)
    1498:	00004517          	auipc	a0,0x4
    149c:	c7c50513          	addi	a0,a0,-900 # 5114 <list_known_crc+0x560>
    14a0:	05c020ef          	jal	ra,34fc <ee_printf>
    14a4:	415010ef          	jal	ra,30b8 <start_time>
    14a8:	00c10513          	addi	a0,sp,12
    14ac:	abdff0ef          	jal	ra,f68 <iterate>
    14b0:	419010ef          	jal	ra,30c8 <stop_time>
    14b4:	425010ef          	jal	ra,30d8 <get_time>
    14b8:	00050593          	mv	a1,a0
    14bc:	00050913          	mv	s2,a0
    14c0:	00004517          	auipc	a0,0x4
    14c4:	c7850513          	addi	a0,a0,-904 # 5138 <list_known_crc+0x584>
    14c8:	034020ef          	jal	ra,34fc <ee_printf>
    14cc:	00c11503          	lh	a0,12(sp)
    14d0:	00000593          	li	a1,0
    14d4:	3d1010ef          	jal	ra,30a4 <crc16>
    14d8:	00050593          	mv	a1,a0
    14dc:	00e11503          	lh	a0,14(sp)
    14e0:	3c5010ef          	jal	ra,30a4 <crc16>
    14e4:	00050593          	mv	a1,a0
    14e8:	01011503          	lh	a0,16(sp)
    14ec:	3b9010ef          	jal	ra,30a4 <crc16>
    14f0:	00050593          	mv	a1,a0
    14f4:	02411503          	lh	a0,36(sp)
    14f8:	3ad010ef          	jal	ra,30a4 <crc16>
    14fc:	000087b7          	lui	a5,0x8
    1500:	b0578793          	addi	a5,a5,-1275 # 7b05 <__global_pointer$+0x12b5>
    1504:	00050a13          	mv	s4,a0
    1508:	7cf50063          	beq	a0,a5,1cc8 <main+0xba8>
    150c:	66a7e263          	bltu	a5,a0,1b70 <main+0xa50>
    1510:	000027b7          	lui	a5,0x2
    1514:	8f278793          	addi	a5,a5,-1806 # 18f2 <main+0x7d2>
    1518:	78f50e63          	beq	a0,a5,1cb4 <main+0xb94>
    151c:	000057b7          	lui	a5,0x5
    1520:	eaf78793          	addi	a5,a5,-337 # 4eaf <list_known_crc+0x2fb>
    1524:	66f51c63          	bne	a0,a5,1b9c <main+0xa7c>
    1528:	00004517          	auipc	a0,0x4
    152c:	c8850513          	addi	a0,a0,-888 # 51b0 <list_known_crc+0x5fc>
    1530:	7cd010ef          	jal	ra,34fc <ee_printf>
    1534:	00200993          	li	s3,2
    1538:	00098593          	mv	a1,s3
    153c:	00004517          	auipc	a0,0x4
    1540:	d0450513          	addi	a0,a0,-764 # 5240 <list_known_crc+0x68c>
    1544:	00005c97          	auipc	s9,0x5
    1548:	b00c8c93          	addi	s9,s9,-1280 # 6044 <default_num_contexts>
    154c:	7b1010ef          	jal	ra,34fc <ee_printf>
    1550:	000ca783          	lw	a5,0(s9)
    1554:	78078e63          	beqz	a5,1cf0 <main+0xbd0>
    1558:	00199a93          	slli	s5,s3,0x1
    155c:	00003b97          	auipc	s7,0x3
    1560:	658b8b93          	addi	s7,s7,1624 # 4bb4 <list_known_crc>
    1564:	00004b17          	auipc	s6,0x4
    1568:	120b0b13          	addi	s6,s6,288 # 5684 <matrix_known_crc>
    156c:	00004797          	auipc	a5,0x4
    1570:	12478793          	addi	a5,a5,292 # 5690 <state_known_crc>
    1574:	015b8bb3          	add	s7,s7,s5
    1578:	015b0b33          	add	s6,s6,s5
    157c:	00000d13          	li	s10,0
    1580:	00000413          	li	s0,0
    1584:	00004c17          	auipc	s8,0x4
    1588:	ce4c0c13          	addi	s8,s8,-796 # 5268 <list_known_crc+0x6b4>
    158c:	01578ab3          	add	s5,a5,s5
    1590:	00441493          	slli	s1,s0,0x4
    1594:	008487b3          	add	a5,s1,s0
    1598:	05010713          	addi	a4,sp,80
    159c:	00279793          	slli	a5,a5,0x2
    15a0:	00f707b3          	add	a5,a4,a5
    15a4:	fdc7a703          	lw	a4,-36(a5)
    15a8:	fe079e23          	sh	zero,-4(a5)
    15ac:	00177713          	andi	a4,a4,1
    15b0:	04070063          	beqz	a4,15f0 <main+0x4d0>
    15b4:	ff67d703          	lhu	a4,-10(a5)
    15b8:	000bd783          	lhu	a5,0(s7)
    15bc:	00040593          	mv	a1,s0
    15c0:	000c0513          	mv	a0,s8
    15c4:	00070613          	mv	a2,a4
    15c8:	00078693          	mv	a3,a5
    15cc:	02f70263          	beq	a4,a5,15f0 <main+0x4d0>
    15d0:	72d010ef          	jal	ra,34fc <ee_printf>
    15d4:	04400793          	li	a5,68
    15d8:	02f407b3          	mul	a5,s0,a5
    15dc:	05010713          	addi	a4,sp,80
    15e0:	00f707b3          	add	a5,a4,a5
    15e4:	ffc7d703          	lhu	a4,-4(a5)
    15e8:	00170713          	addi	a4,a4,1
    15ec:	fee79e23          	sh	a4,-4(a5)
    15f0:	008487b3          	add	a5,s1,s0
    15f4:	05010713          	addi	a4,sp,80
    15f8:	00279793          	slli	a5,a5,0x2
    15fc:	00f707b3          	add	a5,a4,a5
    1600:	fdc7a703          	lw	a4,-36(a5)
    1604:	00277693          	andi	a3,a4,2
    1608:	04068463          	beqz	a3,1650 <main+0x530>
    160c:	ff87d803          	lhu	a6,-8(a5)
    1610:	000b5783          	lhu	a5,0(s6)
    1614:	00040593          	mv	a1,s0
    1618:	00004517          	auipc	a0,0x4
    161c:	c8050513          	addi	a0,a0,-896 # 5298 <list_known_crc+0x6e4>
    1620:	00080613          	mv	a2,a6
    1624:	00078693          	mv	a3,a5
    1628:	02f80463          	beq	a6,a5,1650 <main+0x530>
    162c:	6d1010ef          	jal	ra,34fc <ee_printf>
    1630:	04400793          	li	a5,68
    1634:	02f407b3          	mul	a5,s0,a5
    1638:	05010713          	addi	a4,sp,80
    163c:	00f707b3          	add	a5,a4,a5
    1640:	ffc7d683          	lhu	a3,-4(a5)
    1644:	fdc7a703          	lw	a4,-36(a5)
    1648:	00168693          	addi	a3,a3,1
    164c:	fed79e23          	sh	a3,-4(a5)
    1650:	008487b3          	add	a5,s1,s0
    1654:	00279793          	slli	a5,a5,0x2
    1658:	05010693          	addi	a3,sp,80
    165c:	00477713          	andi	a4,a4,4
    1660:	00f687b3          	add	a5,a3,a5
    1664:	04070263          	beqz	a4,16a8 <main+0x588>
    1668:	ffa7d703          	lhu	a4,-6(a5)
    166c:	000ad783          	lhu	a5,0(s5)
    1670:	00040593          	mv	a1,s0
    1674:	00004517          	auipc	a0,0x4
    1678:	c5850513          	addi	a0,a0,-936 # 52cc <list_known_crc+0x718>
    167c:	00070613          	mv	a2,a4
    1680:	00078693          	mv	a3,a5
    1684:	02f70263          	beq	a4,a5,16a8 <main+0x588>
    1688:	675010ef          	jal	ra,34fc <ee_printf>
    168c:	04400793          	li	a5,68
    1690:	02f407b3          	mul	a5,s0,a5
    1694:	05010713          	addi	a4,sp,80
    1698:	00f707b3          	add	a5,a4,a5
    169c:	ffc7d703          	lhu	a4,-4(a5)
    16a0:	00170713          	addi	a4,a4,1
    16a4:	fee79e23          	sh	a4,-4(a5)
    16a8:	008484b3          	add	s1,s1,s0
    16ac:	05010793          	addi	a5,sp,80
    16b0:	00249493          	slli	s1,s1,0x2
    16b4:	009784b3          	add	s1,a5,s1
    16b8:	ffc4d503          	lhu	a0,-4(s1)
    16bc:	00140413          	addi	s0,s0,1
    16c0:	000ca783          	lw	a5,0(s9)
    16c4:	00ad0d33          	add	s10,s10,a0
    16c8:	01041413          	slli	s0,s0,0x10
    16cc:	010d1d13          	slli	s10,s10,0x10
    16d0:	01045413          	srli	s0,s0,0x10
    16d4:	410d5d13          	srai	s10,s10,0x10
    16d8:	eaf46ce3          	bltu	s0,a5,1590 <main+0x470>
    16dc:	000d0593          	mv	a1,s10
    16e0:	00004517          	auipc	a0,0x4
    16e4:	c1c50513          	addi	a0,a0,-996 # 52fc <list_known_crc+0x748>
    16e8:	615010ef          	jal	ra,34fc <ee_printf>
    16ec:	00004517          	auipc	a0,0x4
    16f0:	c3c50513          	addi	a0,a0,-964 # 5328 <list_known_crc+0x774>
    16f4:	609010ef          	jal	ra,34fc <ee_printf>
    16f8:	1b9010ef          	jal	ra,30b0 <check_data_types>
    16fc:	01a50d33          	add	s10,a0,s10
    1700:	010d1d13          	slli	s10,s10,0x10
    1704:	010d5d13          	srli	s10,s10,0x10
    1708:	010d1493          	slli	s1,s10,0x10
    170c:	4104d493          	srai	s1,s1,0x10
    1710:	00048593          	mv	a1,s1
    1714:	00004517          	auipc	a0,0x4
    1718:	c3050513          	addi	a0,a0,-976 # 5344 <list_known_crc+0x790>
    171c:	5e1010ef          	jal	ra,34fc <ee_printf>
    1720:	00098613          	mv	a2,s3
    1724:	00048593          	mv	a1,s1
    1728:	00004517          	auipc	a0,0x4
    172c:	c4450513          	addi	a0,a0,-956 # 536c <list_known_crc+0x7b8>
    1730:	5cd010ef          	jal	ra,34fc <ee_printf>
    1734:	02412583          	lw	a1,36(sp)
    1738:	00004517          	auipc	a0,0x4
    173c:	c6450513          	addi	a0,a0,-924 # 539c <list_known_crc+0x7e8>
    1740:	5bd010ef          	jal	ra,34fc <ee_printf>
    1744:	00090593          	mv	a1,s2
    1748:	00004517          	auipc	a0,0x4
    174c:	c6c50513          	addi	a0,a0,-916 # 53b4 <list_known_crc+0x800>
    1750:	5ad010ef          	jal	ra,34fc <ee_printf>
    1754:	00090513          	mv	a0,s2
    1758:	199010ef          	jal	ra,30f0 <time_in_secs>
    175c:	00050593          	mv	a1,a0
    1760:	00004517          	auipc	a0,0x4
    1764:	c6c50513          	addi	a0,a0,-916 # 53cc <list_known_crc+0x818>
    1768:	595010ef          	jal	ra,34fc <ee_printf>
    176c:	00090513          	mv	a0,s2
    1770:	181010ef          	jal	ra,30f0 <time_in_secs>
    1774:	44051263          	bnez	a0,1bb8 <main+0xa98>
    1778:	000ca783          	lw	a5,0(s9)
    177c:	02812583          	lw	a1,40(sp)
    1780:	42090863          	beqz	s2,1bb0 <main+0xa90>
    1784:	02b78533          	mul	a0,a5,a1
    1788:	76593737          	lui	a4,0x76593
    178c:	e0070713          	addi	a4,a4,-512 # 76592e00 <__stack_top+0x76582e00>
    1790:	01100813          	li	a6,17
    1794:	00090613          	mv	a2,s2
    1798:	00000693          	li	a3,0
    179c:	02b7b7b3          	mulhu	a5,a5,a1
    17a0:	02a80833          	mul	a6,a6,a0
    17a4:	02e787b3          	mul	a5,a5,a4
    17a8:	02e535b3          	mulhu	a1,a0,a4
    17ac:	010787b3          	add	a5,a5,a6
    17b0:	02e50533          	mul	a0,a0,a4
    17b4:	00b785b3          	add	a1,a5,a1
    17b8:	5cc020ef          	jal	ra,3d84 <__udivdi3>
    17bc:	00050413          	mv	s0,a0
    17c0:	3e800a93          	li	s5,1000
    17c4:	035476b3          	remu	a3,s0,s5
    17c8:	00004597          	auipc	a1,0x4
    17cc:	c3458593          	addi	a1,a1,-972 # 53fc <list_known_crc+0x848>
    17d0:	00004517          	auipc	a0,0x4
    17d4:	c4050513          	addi	a0,a0,-960 # 5410 <list_known_crc+0x85c>
    17d8:	03545633          	divu	a2,s0,s5
    17dc:	521010ef          	jal	ra,34fc <ee_printf>
    17e0:	04b00693          	li	a3,75
    17e4:	02d456b3          	divu	a3,s0,a3
    17e8:	00012637          	lui	a2,0x12
    17ec:	4f860613          	addi	a2,a2,1272 # 124f8 <__stack_top+0x24f8>
    17f0:	00004597          	auipc	a1,0x4
    17f4:	c3058593          	addi	a1,a1,-976 # 5420 <list_known_crc+0x86c>
    17f8:	00004517          	auipc	a0,0x4
    17fc:	c1850513          	addi	a0,a0,-1000 # 5410 <list_known_crc+0x85c>
    1800:	0356f6b3          	remu	a3,a3,s5
    1804:	02c45633          	divu	a2,s0,a2
    1808:	4f5010ef          	jal	ra,34fc <ee_printf>
    180c:	00090513          	mv	a0,s2
    1810:	0e1010ef          	jal	ra,30f0 <time_in_secs>
    1814:	00900793          	li	a5,9
    1818:	3ca7f463          	bgeu	a5,a0,1be0 <main+0xac0>
    181c:	000ca783          	lw	a5,0(s9)
    1820:	02812583          	lw	a1,40(sp)
    1824:	00004517          	auipc	a0,0x4
    1828:	c5050513          	addi	a0,a0,-944 # 5474 <list_known_crc+0x8c0>
    182c:	02f585b3          	mul	a1,a1,a5
    1830:	4cd010ef          	jal	ra,34fc <ee_printf>
    1834:	00004597          	auipc	a1,0x4
    1838:	c5858593          	addi	a1,a1,-936 # 548c <list_known_crc+0x8d8>
    183c:	00004517          	auipc	a0,0x4
    1840:	c5c50513          	addi	a0,a0,-932 # 5498 <list_known_crc+0x8e4>
    1844:	4b9010ef          	jal	ra,34fc <ee_printf>
    1848:	00004597          	auipc	a1,0x4
    184c:	c6858593          	addi	a1,a1,-920 # 54b0 <list_known_crc+0x8fc>
    1850:	00004517          	auipc	a0,0x4
    1854:	c8050513          	addi	a0,a0,-896 # 54d0 <list_known_crc+0x91c>
    1858:	4a5010ef          	jal	ra,34fc <ee_printf>
    185c:	00004597          	auipc	a1,0x4
    1860:	c8c58593          	addi	a1,a1,-884 # 54e8 <list_known_crc+0x934>
    1864:	00004517          	auipc	a0,0x4
    1868:	c8c50513          	addi	a0,a0,-884 # 54f0 <list_known_crc+0x93c>
    186c:	491010ef          	jal	ra,34fc <ee_printf>
    1870:	000a0593          	mv	a1,s4
    1874:	00004517          	auipc	a0,0x4
    1878:	c9450513          	addi	a0,a0,-876 # 5508 <list_known_crc+0x954>
    187c:	481010ef          	jal	ra,34fc <ee_printf>
    1880:	02c12783          	lw	a5,44(sp)
    1884:	0017f713          	andi	a4,a5,1
    1888:	04070a63          	beqz	a4,18dc <main+0x7bc>
    188c:	000ca703          	lw	a4,0(s9)
    1890:	04070663          	beqz	a4,18dc <main+0x7bc>
    1894:	00000413          	li	s0,0
    1898:	00004a17          	auipc	s4,0x4
    189c:	c8ca0a13          	addi	s4,s4,-884 # 5524 <list_known_crc+0x970>
    18a0:	00441793          	slli	a5,s0,0x4
    18a4:	008787b3          	add	a5,a5,s0
    18a8:	05010713          	addi	a4,sp,80
    18ac:	00279793          	slli	a5,a5,0x2
    18b0:	00f707b3          	add	a5,a4,a5
    18b4:	ff67d603          	lhu	a2,-10(a5)
    18b8:	00040593          	mv	a1,s0
    18bc:	000a0513          	mv	a0,s4
    18c0:	43d010ef          	jal	ra,34fc <ee_printf>
    18c4:	00140413          	addi	s0,s0,1
    18c8:	000ca783          	lw	a5,0(s9)
    18cc:	01041413          	slli	s0,s0,0x10
    18d0:	01045413          	srli	s0,s0,0x10
    18d4:	fcf466e3          	bltu	s0,a5,18a0 <main+0x780>
    18d8:	02c12783          	lw	a5,44(sp)
    18dc:	0027f713          	andi	a4,a5,2
    18e0:	04070a63          	beqz	a4,1934 <main+0x814>
    18e4:	000ca703          	lw	a4,0(s9)
    18e8:	40070863          	beqz	a4,1cf8 <main+0xbd8>
    18ec:	00000413          	li	s0,0
    18f0:	00004a17          	auipc	s4,0x4
    18f4:	c50a0a13          	addi	s4,s4,-944 # 5540 <list_known_crc+0x98c>
    18f8:	00441793          	slli	a5,s0,0x4
    18fc:	008787b3          	add	a5,a5,s0
    1900:	05010713          	addi	a4,sp,80
    1904:	00279793          	slli	a5,a5,0x2
    1908:	00f707b3          	add	a5,a4,a5
    190c:	ff87d603          	lhu	a2,-8(a5)
    1910:	00040593          	mv	a1,s0
    1914:	000a0513          	mv	a0,s4
    1918:	3e5010ef          	jal	ra,34fc <ee_printf>
    191c:	00140413          	addi	s0,s0,1
    1920:	000ca783          	lw	a5,0(s9)
    1924:	01041413          	slli	s0,s0,0x10
    1928:	01045413          	srli	s0,s0,0x10
    192c:	fcf466e3          	bltu	s0,a5,18f8 <main+0x7d8>
    1930:	02c12783          	lw	a5,44(sp)
    1934:	0047f793          	andi	a5,a5,4
    1938:	04078863          	beqz	a5,1988 <main+0x868>
    193c:	000ca783          	lw	a5,0(s9)
    1940:	00000413          	li	s0,0
    1944:	00004a17          	auipc	s4,0x4
    1948:	c18a0a13          	addi	s4,s4,-1000 # 555c <list_known_crc+0x9a8>
    194c:	08078463          	beqz	a5,19d4 <main+0x8b4>
    1950:	00441793          	slli	a5,s0,0x4
    1954:	008787b3          	add	a5,a5,s0
    1958:	05010713          	addi	a4,sp,80
    195c:	00279793          	slli	a5,a5,0x2
    1960:	00f707b3          	add	a5,a4,a5
    1964:	ffa7d603          	lhu	a2,-6(a5)
    1968:	00040593          	mv	a1,s0
    196c:	000a0513          	mv	a0,s4
    1970:	38d010ef          	jal	ra,34fc <ee_printf>
    1974:	00140413          	addi	s0,s0,1
    1978:	000ca783          	lw	a5,0(s9)
    197c:	01041413          	slli	s0,s0,0x10
    1980:	01045413          	srli	s0,s0,0x10
    1984:	fcf466e3          	bltu	s0,a5,1950 <main+0x830>
    1988:	000ca783          	lw	a5,0(s9)
    198c:	00000413          	li	s0,0
    1990:	00004a17          	auipc	s4,0x4
    1994:	be8a0a13          	addi	s4,s4,-1048 # 5578 <list_known_crc+0x9c4>
    1998:	02078e63          	beqz	a5,19d4 <main+0x8b4>
    199c:	00441793          	slli	a5,s0,0x4
    19a0:	008787b3          	add	a5,a5,s0
    19a4:	05010713          	addi	a4,sp,80
    19a8:	00279793          	slli	a5,a5,0x2
    19ac:	00f707b3          	add	a5,a4,a5
    19b0:	ff47d603          	lhu	a2,-12(a5)
    19b4:	00040593          	mv	a1,s0
    19b8:	000a0513          	mv	a0,s4
    19bc:	341010ef          	jal	ra,34fc <ee_printf>
    19c0:	00140413          	addi	s0,s0,1
    19c4:	000ca783          	lw	a5,0(s9)
    19c8:	01041413          	slli	s0,s0,0x10
    19cc:	01045413          	srli	s0,s0,0x10
    19d0:	fcf466e3          	bltu	s0,a5,199c <main+0x87c>
    19d4:	22048463          	beqz	s1,1bfc <main+0xadc>
    19d8:	2c905663          	blez	s1,1ca4 <main+0xb84>
    19dc:	00004517          	auipc	a0,0x4
    19e0:	c3050513          	addi	a0,a0,-976 # 560c <list_known_crc+0xa58>
    19e4:	319010ef          	jal	ra,34fc <ee_printf>
    19e8:	04e10513          	addi	a0,sp,78
    19ec:	7d8010ef          	jal	ra,31c4 <portable_fini>
    19f0:	8f5ff06f          	j	12e4 <main+0x1c4>
    19f4:	00000593          	li	a1,0
    19f8:	00003517          	auipc	a0,0x3
    19fc:	5c850513          	addi	a0,a0,1480 # 4fc0 <list_known_crc+0x40c>
    1a00:	2fd010ef          	jal	ra,34fc <ee_printf>
    1a04:	00e11783          	lh	a5,14(sp)
    1a08:	00c11603          	lh	a2,12(sp)
    1a0c:	01c12583          	lw	a1,28(sp)
    1a10:	02412503          	lw	a0,36(sp)
    1a14:	01079793          	slli	a5,a5,0x10
    1a18:	00c7e633          	or	a2,a5,a2
    1a1c:	03410693          	addi	a3,sp,52
    1a20:	2e4000ef          	jal	ra,1d04 <core_init_matrix>
    1a24:	00000593          	li	a1,0
    1a28:	00003517          	auipc	a0,0x3
    1a2c:	5b850513          	addi	a0,a0,1464 # 4fe0 <list_known_crc+0x42c>
    1a30:	2cd010ef          	jal	ra,34fc <ee_printf>
    1a34:	02c12783          	lw	a5,44(sp)
    1a38:	a05ff06f          	j	143c <main+0x31c>
    1a3c:	00000593          	li	a1,0
    1a40:	00003517          	auipc	a0,0x3
    1a44:	54050513          	addi	a0,a0,1344 # 4f80 <list_known_crc+0x3cc>
    1a48:	2b5010ef          	jal	ra,34fc <ee_printf>
    1a4c:	00c11603          	lh	a2,12(sp)
    1a50:	01812583          	lw	a1,24(sp)
    1a54:	02412503          	lw	a0,36(sp)
    1a58:	8a4ff0ef          	jal	ra,afc <core_list_init>
    1a5c:	02a12823          	sw	a0,48(sp)
    1a60:	00000593          	li	a1,0
    1a64:	00003517          	auipc	a0,0x3
    1a68:	53c50513          	addi	a0,a0,1340 # 4fa0 <list_known_crc+0x3ec>
    1a6c:	291010ef          	jal	ra,34fc <ee_printf>
    1a70:	02c12783          	lw	a5,44(sp)
    1a74:	9c1ff06f          	j	1434 <main+0x314>
    1a78:	00040613          	mv	a2,s0
    1a7c:	00048593          	mv	a1,s1
    1a80:	000a0513          	mv	a0,s4
    1a84:	279010ef          	jal	ra,34fc <ee_printf>
    1a88:	02412703          	lw	a4,36(sp)
    1a8c:	00249793          	slli	a5,s1,0x2
    1a90:	00048613          	mv	a2,s1
    1a94:	02e406b3          	mul	a3,s0,a4
    1a98:	00c10713          	addi	a4,sp,12
    1a9c:	00f707b3          	add	a5,a4,a5
    1aa0:	01412703          	lw	a4,20(sp)
    1aa4:	00140413          	addi	s0,s0,1
    1aa8:	00000593          	li	a1,0
    1aac:	00098513          	mv	a0,s3
    1ab0:	01041413          	slli	s0,s0,0x10
    1ab4:	01045413          	srli	s0,s0,0x10
    1ab8:	00d70733          	add	a4,a4,a3
    1abc:	00070693          	mv	a3,a4
    1ac0:	00e7a623          	sw	a4,12(a5)
    1ac4:	239010ef          	jal	ra,34fc <ee_printf>
    1ac8:	949ff06f          	j	1410 <main+0x2f0>
    1acc:	00003517          	auipc	a0,0x3
    1ad0:	58c50513          	addi	a0,a0,1420 # 5058 <list_known_crc+0x4a4>
    1ad4:	229010ef          	jal	ra,34fc <ee_printf>
    1ad8:	00100793          	li	a5,1
    1adc:	02f12423          	sw	a5,40(sp)
    1ae0:	00003917          	auipc	s2,0x3
    1ae4:	59090913          	addi	s2,s2,1424 # 5070 <list_known_crc+0x4bc>
    1ae8:	00003497          	auipc	s1,0x3
    1aec:	5ac48493          	addi	s1,s1,1452 # 5094 <list_known_crc+0x4e0>
    1af0:	02812703          	lw	a4,40(sp)
    1af4:	00090513          	mv	a0,s2
    1af8:	00271793          	slli	a5,a4,0x2
    1afc:	00e787b3          	add	a5,a5,a4
    1b00:	00179793          	slli	a5,a5,0x1
    1b04:	00078593          	mv	a1,a5
    1b08:	02f12423          	sw	a5,40(sp)
    1b0c:	1f1010ef          	jal	ra,34fc <ee_printf>
    1b10:	5a8010ef          	jal	ra,30b8 <start_time>
    1b14:	00c10513          	addi	a0,sp,12
    1b18:	c50ff0ef          	jal	ra,f68 <iterate>
    1b1c:	5ac010ef          	jal	ra,30c8 <stop_time>
    1b20:	5b8010ef          	jal	ra,30d8 <get_time>
    1b24:	5cc010ef          	jal	ra,30f0 <time_in_secs>
    1b28:	00050413          	mv	s0,a0
    1b2c:	5ac010ef          	jal	ra,30d8 <get_time>
    1b30:	00050593          	mv	a1,a0
    1b34:	00040613          	mv	a2,s0
    1b38:	00048513          	mv	a0,s1
    1b3c:	1c1010ef          	jal	ra,34fc <ee_printf>
    1b40:	fa0408e3          	beqz	s0,1af0 <main+0x9d0>
    1b44:	00a00793          	li	a5,10
    1b48:	0287d7b3          	divu	a5,a5,s0
    1b4c:	02812703          	lw	a4,40(sp)
    1b50:	00003517          	auipc	a0,0x3
    1b54:	57050513          	addi	a0,a0,1392 # 50c0 <list_known_crc+0x50c>
    1b58:	00178793          	addi	a5,a5,1
    1b5c:	02e787b3          	mul	a5,a5,a4
    1b60:	00078593          	mv	a1,a5
    1b64:	02f12423          	sw	a5,40(sp)
    1b68:	195010ef          	jal	ra,34fc <ee_printf>
    1b6c:	929ff06f          	j	1494 <main+0x374>
    1b70:	000097b7          	lui	a5,0x9
    1b74:	a0278793          	addi	a5,a5,-1534 # 8a02 <__global_pointer$+0x21b2>
    1b78:	16f50263          	beq	a0,a5,1cdc <main+0xbbc>
    1b7c:	0000f7b7          	lui	a5,0xf
    1b80:	9f578793          	addi	a5,a5,-1547 # e9f5 <__global_pointer$+0x81a5>
    1b84:	00f51c63          	bne	a0,a5,1b9c <main+0xa7c>
    1b88:	00003517          	auipc	a0,0x3
    1b8c:	65c50513          	addi	a0,a0,1628 # 51e4 <list_known_crc+0x630>
    1b90:	16d010ef          	jal	ra,34fc <ee_printf>
    1b94:	00300993          	li	s3,3
    1b98:	9a1ff06f          	j	1538 <main+0x418>
    1b9c:	fff00993          	li	s3,-1
    1ba0:	fff00d13          	li	s10,-1
    1ba4:	00004c97          	auipc	s9,0x4
    1ba8:	4a0c8c93          	addi	s9,s9,1184 # 6044 <default_num_contexts>
    1bac:	b41ff06f          	j	16ec <main+0x5cc>
    1bb0:	00000413          	li	s0,0
    1bb4:	c0dff06f          	j	17c0 <main+0x6a0>
    1bb8:	000ca583          	lw	a1,0(s9)
    1bbc:	02812403          	lw	s0,40(sp)
    1bc0:	00090513          	mv	a0,s2
    1bc4:	02b40433          	mul	s0,s0,a1
    1bc8:	528010ef          	jal	ra,30f0 <time_in_secs>
    1bcc:	02a455b3          	divu	a1,s0,a0
    1bd0:	00004517          	auipc	a0,0x4
    1bd4:	81450513          	addi	a0,a0,-2028 # 53e4 <list_known_crc+0x830>
    1bd8:	125010ef          	jal	ra,34fc <ee_printf>
    1bdc:	b9dff06f          	j	1778 <main+0x658>
    1be0:	001d0493          	addi	s1,s10,1
    1be4:	00004517          	auipc	a0,0x4
    1be8:	85050513          	addi	a0,a0,-1968 # 5434 <list_known_crc+0x880>
    1bec:	01049493          	slli	s1,s1,0x10
    1bf0:	10d010ef          	jal	ra,34fc <ee_printf>
    1bf4:	4104d493          	srai	s1,s1,0x10
    1bf8:	c25ff06f          	j	181c <main+0x6fc>
    1bfc:	00004517          	auipc	a0,0x4
    1c00:	99850513          	addi	a0,a0,-1640 # 5594 <list_known_crc+0x9e0>
    1c04:	0f9010ef          	jal	ra,34fc <ee_printf>
    1c08:	00300793          	li	a5,3
    1c0c:	dcf99ee3          	bne	s3,a5,19e8 <main+0x8c8>
    1c10:	000ca783          	lw	a5,0(s9)
    1c14:	02812583          	lw	a1,40(sp)
    1c18:	04090063          	beqz	s2,1c58 <main+0xb38>
    1c1c:	02b78533          	mul	a0,a5,a1
    1c20:	76593737          	lui	a4,0x76593
    1c24:	e0070713          	addi	a4,a4,-512 # 76592e00 <__stack_top+0x76582e00>
    1c28:	01100813          	li	a6,17
    1c2c:	00090613          	mv	a2,s2
    1c30:	00000693          	li	a3,0
    1c34:	02b7b7b3          	mulhu	a5,a5,a1
    1c38:	02a80833          	mul	a6,a6,a0
    1c3c:	02e787b3          	mul	a5,a5,a4
    1c40:	02e535b3          	mulhu	a1,a0,a4
    1c44:	010787b3          	add	a5,a5,a6
    1c48:	02e50533          	mul	a0,a0,a4
    1c4c:	00b785b3          	add	a1,a5,a1
    1c50:	134020ef          	jal	ra,3d84 <__udivdi3>
    1c54:	00050913          	mv	s2,a0
    1c58:	3e800593          	li	a1,1000
    1c5c:	02b97633          	remu	a2,s2,a1
    1c60:	00004717          	auipc	a4,0x4
    1c64:	85070713          	addi	a4,a4,-1968 # 54b0 <list_known_crc+0x8fc>
    1c68:	00004697          	auipc	a3,0x4
    1c6c:	82468693          	addi	a3,a3,-2012 # 548c <list_known_crc+0x8d8>
    1c70:	00004517          	auipc	a0,0x4
    1c74:	97050513          	addi	a0,a0,-1680 # 55e0 <list_known_crc+0xa2c>
    1c78:	02b955b3          	divu	a1,s2,a1
    1c7c:	081010ef          	jal	ra,34fc <ee_printf>
    1c80:	00004597          	auipc	a1,0x4
    1c84:	86858593          	addi	a1,a1,-1944 # 54e8 <list_known_crc+0x934>
    1c88:	00004517          	auipc	a0,0x4
    1c8c:	97c50513          	addi	a0,a0,-1668 # 5604 <list_known_crc+0xa50>
    1c90:	06d010ef          	jal	ra,34fc <ee_printf>
    1c94:	00004517          	auipc	a0,0x4
    1c98:	fac50513          	addi	a0,a0,-84 # 5c40 <scipat+0x144>
    1c9c:	061010ef          	jal	ra,34fc <ee_printf>
    1ca0:	d49ff06f          	j	19e8 <main+0x8c8>
    1ca4:	00004517          	auipc	a0,0x4
    1ca8:	97c50513          	addi	a0,a0,-1668 # 5620 <list_known_crc+0xa6c>
    1cac:	051010ef          	jal	ra,34fc <ee_printf>
    1cb0:	d39ff06f          	j	19e8 <main+0x8c8>
    1cb4:	00003517          	auipc	a0,0x3
    1cb8:	56050513          	addi	a0,a0,1376 # 5214 <list_known_crc+0x660>
    1cbc:	041010ef          	jal	ra,34fc <ee_printf>
    1cc0:	00400993          	li	s3,4
    1cc4:	875ff06f          	j	1538 <main+0x418>
    1cc8:	00003517          	auipc	a0,0x3
    1ccc:	4bc50513          	addi	a0,a0,1212 # 5184 <list_known_crc+0x5d0>
    1cd0:	02d010ef          	jal	ra,34fc <ee_printf>
    1cd4:	00100993          	li	s3,1
    1cd8:	861ff06f          	j	1538 <main+0x418>
    1cdc:	00003517          	auipc	a0,0x3
    1ce0:	47850513          	addi	a0,a0,1144 # 5154 <list_known_crc+0x5a0>
    1ce4:	019010ef          	jal	ra,34fc <ee_printf>
    1ce8:	00000993          	li	s3,0
    1cec:	84dff06f          	j	1538 <main+0x418>
    1cf0:	00000d13          	li	s10,0
    1cf4:	9e9ff06f          	j	16dc <main+0x5bc>
    1cf8:	0047f793          	andi	a5,a5,4
    1cfc:	cc079ce3          	bnez	a5,19d4 <main+0x8b4>
    1d00:	c89ff06f          	j	1988 <main+0x868>

00001d04 <core_init_matrix>:
    1d04:	ff010113          	addi	sp,sp,-16
    1d08:	00812623          	sw	s0,12(sp)
    1d0c:	00912423          	sw	s1,8(sp)
    1d10:	01212223          	sw	s2,4(sp)
    1d14:	00050813          	mv	a6,a0
    1d18:	00061463          	bnez	a2,1d20 <core_init_matrix+0x1c>
    1d1c:	00100613          	li	a2,1
    1d20:	fff58393          	addi	t2,a1,-1
    1d24:	ffc3f393          	andi	t2,t2,-4
    1d28:	00438493          	addi	s1,t2,4
    1d2c:	00000513          	li	a0,0
    1d30:	00081663          	bnez	a6,1d3c <core_init_matrix+0x38>
    1d34:	0e00006f          	j	1e14 <core_init_matrix+0x110>
    1d38:	00070513          	mv	a0,a4
    1d3c:	00150713          	addi	a4,a0,1
    1d40:	02e707b3          	mul	a5,a4,a4
    1d44:	00379793          	slli	a5,a5,0x3
    1d48:	ff07e8e3          	bltu	a5,a6,1d38 <core_init_matrix+0x34>
    1d4c:	02a502b3          	mul	t0,a0,a0
    1d50:	00050913          	mv	s2,a0
    1d54:	00129293          	slli	t0,t0,0x1
    1d58:	005483b3          	add	t2,s1,t0
    1d5c:	08050263          	beqz	a0,1de0 <core_init_matrix+0xdc>
    1d60:	00010e37          	lui	t3,0x10
    1d64:	00151413          	slli	s0,a0,0x1
    1d68:	00038f93          	mv	t6,t2
    1d6c:	00000f13          	li	t5,0
    1d70:	00100813          	li	a6,1
    1d74:	40748eb3          	sub	t4,s1,t2
    1d78:	fffe0e13          	addi	t3,t3,-1 # ffff <__global_pointer$+0x97af>
    1d7c:	000f8593          	mv	a1,t6
    1d80:	00000893          	li	a7,0
    1d84:	03060633          	mul	a2,a2,a6
    1d88:	01081793          	slli	a5,a6,0x10
    1d8c:	0107d793          	srli	a5,a5,0x10
    1d90:	00be8333          	add	t1,t4,a1
    1d94:	00258593          	addi	a1,a1,2
    1d98:	00188893          	addi	a7,a7,1
    1d9c:	00180813          	addi	a6,a6,1
    1da0:	41f65713          	srai	a4,a2,0x1f
    1da4:	01075713          	srli	a4,a4,0x10
    1da8:	00e60633          	add	a2,a2,a4
    1dac:	01c67633          	and	a2,a2,t3
    1db0:	40e60633          	sub	a2,a2,a4
    1db4:	00c78733          	add	a4,a5,a2
    1db8:	01071713          	slli	a4,a4,0x10
    1dbc:	01075713          	srli	a4,a4,0x10
    1dc0:	00f707b3          	add	a5,a4,a5
    1dc4:	fee59f23          	sh	a4,-2(a1)
    1dc8:	0ff7f793          	andi	a5,a5,255
    1dcc:	00f31023          	sh	a5,0(t1)
    1dd0:	faa8eae3          	bltu	a7,a0,1d84 <core_init_matrix+0x80>
    1dd4:	001f0f13          	addi	t5,t5,1
    1dd8:	008f8fb3          	add	t6,t6,s0
    1ddc:	faaf60e3          	bltu	t5,a0,1d7c <core_init_matrix+0x78>
    1de0:	005387b3          	add	a5,t2,t0
    1de4:	fff78793          	addi	a5,a5,-1
    1de8:	00c12403          	lw	s0,12(sp)
    1dec:	ffc7f793          	andi	a5,a5,-4
    1df0:	00478793          	addi	a5,a5,4
    1df4:	0096a223          	sw	s1,4(a3)
    1df8:	0126a023          	sw	s2,0(a3)
    1dfc:	0076a423          	sw	t2,8(a3)
    1e00:	00f6a623          	sw	a5,12(a3)
    1e04:	00812483          	lw	s1,8(sp)
    1e08:	00412903          	lw	s2,4(sp)
    1e0c:	01010113          	addi	sp,sp,16
    1e10:	00008067          	ret
    1e14:	00638393          	addi	t2,t2,6
    1e18:	fff00913          	li	s2,-1
    1e1c:	fff00513          	li	a0,-1
    1e20:	00200293          	li	t0,2
    1e24:	f3dff06f          	j	1d60 <core_init_matrix+0x5c>

00001e28 <matrix_mul_vect>:
    1e28:	04050663          	beqz	a0,1e74 <matrix_mul_vect+0x4c>
    1e2c:	00151e93          	slli	t4,a0,0x1
    1e30:	00251513          	slli	a0,a0,0x2
    1e34:	00a58e33          	add	t3,a1,a0
    1e38:	01d68333          	add	t1,a3,t4
    1e3c:	00068793          	mv	a5,a3
    1e40:	00060513          	mv	a0,a2
    1e44:	00000813          	li	a6,0
    1e48:	00051703          	lh	a4,0(a0)
    1e4c:	00079883          	lh	a7,0(a5)
    1e50:	00278793          	addi	a5,a5,2
    1e54:	00250513          	addi	a0,a0,2
    1e58:	03170733          	mul	a4,a4,a7
    1e5c:	00e80833          	add	a6,a6,a4
    1e60:	fef314e3          	bne	t1,a5,1e48 <matrix_mul_vect+0x20>
    1e64:	0105a023          	sw	a6,0(a1)
    1e68:	00458593          	addi	a1,a1,4
    1e6c:	01d60633          	add	a2,a2,t4
    1e70:	fcbe16e3          	bne	t3,a1,1e3c <matrix_mul_vect+0x14>
    1e74:	00008067          	ret

00001e78 <matrix_mul_matrix>:
    1e78:	08050463          	beqz	a0,1f00 <matrix_mul_matrix+0x88>
    1e7c:	00151893          	slli	a7,a0,0x1
    1e80:	ff010113          	addi	sp,sp,-16
    1e84:	00812623          	sw	s0,12(sp)
    1e88:	00060f13          	mv	t5,a2
    1e8c:	01160333          	add	t1,a2,a7
    1e90:	00251413          	slli	s0,a0,0x2
    1e94:	00058293          	mv	t0,a1
    1e98:	01168fb3          	add	t6,a3,a7
    1e9c:	00000393          	li	t2,0
    1ea0:	00068e13          	mv	t3,a3
    1ea4:	00028e93          	mv	t4,t0
    1ea8:	000e0613          	mv	a2,t3
    1eac:	000f0793          	mv	a5,t5
    1eb0:	00000593          	li	a1,0
    1eb4:	00079703          	lh	a4,0(a5)
    1eb8:	00061803          	lh	a6,0(a2)
    1ebc:	00278793          	addi	a5,a5,2
    1ec0:	01160633          	add	a2,a2,a7
    1ec4:	03070733          	mul	a4,a4,a6
    1ec8:	00e585b3          	add	a1,a1,a4
    1ecc:	fef314e3          	bne	t1,a5,1eb4 <matrix_mul_matrix+0x3c>
    1ed0:	00bea023          	sw	a1,0(t4)
    1ed4:	002e0e13          	addi	t3,t3,2
    1ed8:	004e8e93          	addi	t4,t4,4
    1edc:	fdcf96e3          	bne	t6,t3,1ea8 <matrix_mul_matrix+0x30>
    1ee0:	00138393          	addi	t2,t2,1
    1ee4:	011f0f33          	add	t5,t5,a7
    1ee8:	01130333          	add	t1,t1,a7
    1eec:	008282b3          	add	t0,t0,s0
    1ef0:	fa7518e3          	bne	a0,t2,1ea0 <matrix_mul_matrix+0x28>
    1ef4:	00c12403          	lw	s0,12(sp)
    1ef8:	01010113          	addi	sp,sp,16
    1efc:	00008067          	ret
    1f00:	00008067          	ret

00001f04 <matrix_mul_matrix_bitextract>:
    1f04:	08050e63          	beqz	a0,1fa0 <matrix_mul_matrix_bitextract+0x9c>
    1f08:	00151893          	slli	a7,a0,0x1
    1f0c:	ff010113          	addi	sp,sp,-16
    1f10:	00812623          	sw	s0,12(sp)
    1f14:	00060f13          	mv	t5,a2
    1f18:	01160333          	add	t1,a2,a7
    1f1c:	00251413          	slli	s0,a0,0x2
    1f20:	00058293          	mv	t0,a1
    1f24:	01168fb3          	add	t6,a3,a7
    1f28:	00000393          	li	t2,0
    1f2c:	00068e13          	mv	t3,a3
    1f30:	00028e93          	mv	t4,t0
    1f34:	000e0593          	mv	a1,t3
    1f38:	000f0613          	mv	a2,t5
    1f3c:	00000813          	li	a6,0
    1f40:	00059703          	lh	a4,0(a1)
    1f44:	00061783          	lh	a5,0(a2)
    1f48:	00260613          	addi	a2,a2,2
    1f4c:	011585b3          	add	a1,a1,a7
    1f50:	02e787b3          	mul	a5,a5,a4
    1f54:	4027d713          	srai	a4,a5,0x2
    1f58:	4057d793          	srai	a5,a5,0x5
    1f5c:	00f77713          	andi	a4,a4,15
    1f60:	07f7f793          	andi	a5,a5,127
    1f64:	02f707b3          	mul	a5,a4,a5
    1f68:	00f80833          	add	a6,a6,a5
    1f6c:	fcc31ae3          	bne	t1,a2,1f40 <matrix_mul_matrix_bitextract+0x3c>
    1f70:	010ea023          	sw	a6,0(t4)
    1f74:	002e0e13          	addi	t3,t3,2
    1f78:	004e8e93          	addi	t4,t4,4
    1f7c:	fbcf9ce3          	bne	t6,t3,1f34 <matrix_mul_matrix_bitextract+0x30>
    1f80:	00138393          	addi	t2,t2,1
    1f84:	011f0f33          	add	t5,t5,a7
    1f88:	01130333          	add	t1,t1,a7
    1f8c:	008282b3          	add	t0,t0,s0
    1f90:	f8751ee3          	bne	a0,t2,1f2c <matrix_mul_matrix_bitextract+0x28>
    1f94:	00c12403          	lw	s0,12(sp)
    1f98:	01010113          	addi	sp,sp,16
    1f9c:	00008067          	ret
    1fa0:	00008067          	ret

00001fa4 <matrix_test>:
    1fa4:	fd010113          	addi	sp,sp,-48
    1fa8:	01712623          	sw	s7,12(sp)
    1fac:	fe018b93          	addi	s7,gp,-32 # 6830 <g_matrix_test_log_count>
    1fb0:	02912223          	sw	s1,36(sp)
    1fb4:	000ba483          	lw	s1,0(s7)
    1fb8:	02812423          	sw	s0,40(sp)
    1fbc:	03212023          	sw	s2,32(sp)
    1fc0:	01312e23          	sw	s3,28(sp)
    1fc4:	01412c23          	sw	s4,24(sp)
    1fc8:	01512a23          	sw	s5,20(sp)
    1fcc:	01612823          	sw	s6,16(sp)
    1fd0:	01812423          	sw	s8,8(sp)
    1fd4:	fffffab7          	lui	s5,0xfffff
    1fd8:	01071b13          	slli	s6,a4,0x10
    1fdc:	02112623          	sw	ra,44(sp)
    1fe0:	00f00793          	li	a5,15
    1fe4:	00070c13          	mv	s8,a4
    1fe8:	00050a13          	mv	s4,a0
    1fec:	00058913          	mv	s2,a1
    1ff0:	00060413          	mv	s0,a2
    1ff4:	00068993          	mv	s3,a3
    1ff8:	01576ab3          	or	s5,a4,s5
    1ffc:	010b5b13          	srli	s6,s6,0x10
    2000:	4497f463          	bgeu	a5,s1,2448 <matrix_test+0x4a4>
    2004:	00148793          	addi	a5,s1,1
    2008:	fef1a023          	sw	a5,-32(gp) # 6830 <g_matrix_test_log_count>
    200c:	040a0263          	beqz	s4,2050 <matrix_test+0xac>
    2010:	41400733          	neg	a4,s4
    2014:	001a1613          	slli	a2,s4,0x1
    2018:	00171813          	slli	a6,a4,0x1
    201c:	00c40633          	add	a2,s0,a2
    2020:	00000593          	li	a1,0
    2024:	00271713          	slli	a4,a4,0x2
    2028:	01060533          	add	a0,a2,a6
    202c:	00050793          	mv	a5,a0
    2030:	0007d683          	lhu	a3,0(a5)
    2034:	00278793          	addi	a5,a5,2
    2038:	00db06b3          	add	a3,s6,a3
    203c:	fed79f23          	sh	a3,-2(a5)
    2040:	fef618e3          	bne	a2,a5,2030 <matrix_test+0x8c>
    2044:	00158593          	addi	a1,a1,1
    2048:	40e50633          	sub	a2,a0,a4
    204c:	fcba1ee3          	bne	s4,a1,2028 <matrix_test+0x84>
    2050:	00f00793          	li	a5,15
    2054:	3697fa63          	bgeu	a5,s1,23c8 <matrix_test+0x424>
    2058:	380a0663          	beqz	s4,23e4 <matrix_test+0x440>
    205c:	41400733          	neg	a4,s4
    2060:	001a1593          	slli	a1,s4,0x1
    2064:	00171313          	slli	t1,a4,0x1
    2068:	002a1b93          	slli	s7,s4,0x2
    206c:	00090813          	mv	a6,s2
    2070:	00b405b3          	add	a1,s0,a1
    2074:	00000513          	li	a0,0
    2078:	00271713          	slli	a4,a4,0x2
    207c:	00b308b3          	add	a7,t1,a1
    2080:	00080613          	mv	a2,a6
    2084:	00088793          	mv	a5,a7
    2088:	00079683          	lh	a3,0(a5)
    208c:	00460613          	addi	a2,a2,4
    2090:	00278793          	addi	a5,a5,2
    2094:	038686b3          	mul	a3,a3,s8
    2098:	fed62e23          	sw	a3,-4(a2)
    209c:	fef596e3          	bne	a1,a5,2088 <matrix_test+0xe4>
    20a0:	00150513          	addi	a0,a0,1
    20a4:	01780833          	add	a6,a6,s7
    20a8:	40e885b3          	sub	a1,a7,a4
    20ac:	fcaa18e3          	bne	s4,a0,207c <matrix_test+0xd8>
    20b0:	00f00793          	li	a5,15
    20b4:	5e97fa63          	bgeu	a5,s1,26a8 <matrix_test+0x704>
    20b8:	00090313          	mv	t1,s2
    20bc:	00000513          	li	a0,0
    20c0:	00000793          	li	a5,0
    20c4:	00000693          	li	a3,0
    20c8:	00000893          	li	a7,0
    20cc:	00030593          	mv	a1,t1
    20d0:	00000613          	li	a2,0
    20d4:	0200006f          	j	20f4 <matrix_test+0x150>
    20d8:	01081513          	slli	a0,a6,0x10
    20dc:	00160613          	addi	a2,a2,1
    20e0:	41055513          	srai	a0,a0,0x10
    20e4:	00000693          	li	a3,0
    20e8:	00458593          	addi	a1,a1,4
    20ec:	00070793          	mv	a5,a4
    20f0:	03467e63          	bgeu	a2,s4,212c <matrix_test+0x188>
    20f4:	0005a703          	lw	a4,0(a1)
    20f8:	01051513          	slli	a0,a0,0x10
    20fc:	01055513          	srli	a0,a0,0x10
    2100:	00e7a7b3          	slt	a5,a5,a4
    2104:	00e686b3          	add	a3,a3,a4
    2108:	00a50813          	addi	a6,a0,10
    210c:	00f50533          	add	a0,a0,a5
    2110:	fcdac4e3          	blt	s5,a3,20d8 <matrix_test+0x134>
    2114:	01051513          	slli	a0,a0,0x10
    2118:	00160613          	addi	a2,a2,1
    211c:	41055513          	srai	a0,a0,0x10
    2120:	00458593          	addi	a1,a1,4
    2124:	00070793          	mv	a5,a4
    2128:	fd4666e3          	bltu	a2,s4,20f4 <matrix_test+0x150>
    212c:	00188893          	addi	a7,a7,1
    2130:	01730333          	add	t1,t1,s7
    2134:	f948ece3          	bltu	a7,s4,20cc <matrix_test+0x128>
    2138:	00000593          	li	a1,0
    213c:	769000ef          	jal	ra,30a4 <crc16>
    2140:	00f00793          	li	a5,15
    2144:	00050c13          	mv	s8,a0
    2148:	5097f863          	bgeu	a5,s1,2658 <matrix_test+0x6b4>
    214c:	00098693          	mv	a3,s3
    2150:	00040613          	mv	a2,s0
    2154:	00090593          	mv	a1,s2
    2158:	000a0513          	mv	a0,s4
    215c:	ccdff0ef          	jal	ra,1e28 <matrix_mul_vect>
    2160:	2a0a0863          	beqz	s4,2410 <matrix_test+0x46c>
    2164:	00090313          	mv	t1,s2
    2168:	00000513          	li	a0,0
    216c:	00000793          	li	a5,0
    2170:	00000693          	li	a3,0
    2174:	00000893          	li	a7,0
    2178:	00030593          	mv	a1,t1
    217c:	00000613          	li	a2,0
    2180:	0200006f          	j	21a0 <matrix_test+0x1fc>
    2184:	01081513          	slli	a0,a6,0x10
    2188:	00160613          	addi	a2,a2,1
    218c:	41055513          	srai	a0,a0,0x10
    2190:	00000693          	li	a3,0
    2194:	00458593          	addi	a1,a1,4
    2198:	00070793          	mv	a5,a4
    219c:	03467e63          	bgeu	a2,s4,21d8 <matrix_test+0x234>
    21a0:	0005a703          	lw	a4,0(a1)
    21a4:	01051513          	slli	a0,a0,0x10
    21a8:	01055513          	srli	a0,a0,0x10
    21ac:	00e7a7b3          	slt	a5,a5,a4
    21b0:	00e686b3          	add	a3,a3,a4
    21b4:	00a50813          	addi	a6,a0,10
    21b8:	00f50533          	add	a0,a0,a5
    21bc:	fcdac4e3          	blt	s5,a3,2184 <matrix_test+0x1e0>
    21c0:	01051513          	slli	a0,a0,0x10
    21c4:	00160613          	addi	a2,a2,1
    21c8:	41055513          	srai	a0,a0,0x10
    21cc:	00458593          	addi	a1,a1,4
    21d0:	00070793          	mv	a5,a4
    21d4:	fd4666e3          	bltu	a2,s4,21a0 <matrix_test+0x1fc>
    21d8:	00188893          	addi	a7,a7,1
    21dc:	01730333          	add	t1,t1,s7
    21e0:	f948ece3          	bltu	a7,s4,2178 <matrix_test+0x1d4>
    21e4:	000c0593          	mv	a1,s8
    21e8:	6bd000ef          	jal	ra,30a4 <crc16>
    21ec:	00f00793          	li	a5,15
    21f0:	00050c13          	mv	s8,a0
    21f4:	3e97fc63          	bgeu	a5,s1,25ec <matrix_test+0x648>
    21f8:	00098693          	mv	a3,s3
    21fc:	00040613          	mv	a2,s0
    2200:	00090593          	mv	a1,s2
    2204:	000a0513          	mv	a0,s4
    2208:	c71ff0ef          	jal	ra,1e78 <matrix_mul_matrix>
    220c:	00090313          	mv	t1,s2
    2210:	00000513          	li	a0,0
    2214:	00000793          	li	a5,0
    2218:	00000693          	li	a3,0
    221c:	00000893          	li	a7,0
    2220:	00030593          	mv	a1,t1
    2224:	00000613          	li	a2,0
    2228:	0200006f          	j	2248 <matrix_test+0x2a4>
    222c:	01081513          	slli	a0,a6,0x10
    2230:	00160613          	addi	a2,a2,1
    2234:	41055513          	srai	a0,a0,0x10
    2238:	00000693          	li	a3,0
    223c:	00458593          	addi	a1,a1,4
    2240:	00070793          	mv	a5,a4
    2244:	03467e63          	bgeu	a2,s4,2280 <matrix_test+0x2dc>
    2248:	0005a703          	lw	a4,0(a1)
    224c:	01051513          	slli	a0,a0,0x10
    2250:	01055513          	srli	a0,a0,0x10
    2254:	00e7a7b3          	slt	a5,a5,a4
    2258:	00e686b3          	add	a3,a3,a4
    225c:	00a50813          	addi	a6,a0,10
    2260:	00f50533          	add	a0,a0,a5
    2264:	fcdac4e3          	blt	s5,a3,222c <matrix_test+0x288>
    2268:	01051513          	slli	a0,a0,0x10
    226c:	00160613          	addi	a2,a2,1
    2270:	41055513          	srai	a0,a0,0x10
    2274:	00458593          	addi	a1,a1,4
    2278:	00070793          	mv	a5,a4
    227c:	fd4666e3          	bltu	a2,s4,2248 <matrix_test+0x2a4>
    2280:	00188893          	addi	a7,a7,1
    2284:	01730333          	add	t1,t1,s7
    2288:	f948ece3          	bltu	a7,s4,2220 <matrix_test+0x27c>
    228c:	000c0593          	mv	a1,s8
    2290:	615000ef          	jal	ra,30a4 <crc16>
    2294:	00f00793          	li	a5,15
    2298:	00050b93          	mv	s7,a0
    229c:	3097f263          	bgeu	a5,s1,25a0 <matrix_test+0x5fc>
    22a0:	00098693          	mv	a3,s3
    22a4:	00040613          	mv	a2,s0
    22a8:	00090593          	mv	a1,s2
    22ac:	000a0513          	mv	a0,s4
    22b0:	c55ff0ef          	jal	ra,1f04 <matrix_mul_matrix_bitextract>
    22b4:	1c0a0663          	beqz	s4,2480 <matrix_test+0x4dc>
    22b8:	41400733          	neg	a4,s4
    22bc:	002a1793          	slli	a5,s4,0x2
    22c0:	00f90933          	add	s2,s2,a5
    22c4:	00271e13          	slli	t3,a4,0x2
    22c8:	00000513          	li	a0,0
    22cc:	00000793          	li	a5,0
    22d0:	00000613          	li	a2,0
    22d4:	00000893          	li	a7,0
    22d8:	00371813          	slli	a6,a4,0x3
    22dc:	012e0333          	add	t1,t3,s2
    22e0:	00030713          	mv	a4,t1
    22e4:	01c0006f          	j	2300 <matrix_test+0x35c>
    22e8:	01059513          	slli	a0,a1,0x10
    22ec:	00470713          	addi	a4,a4,4
    22f0:	41055513          	srai	a0,a0,0x10
    22f4:	00000613          	li	a2,0
    22f8:	00068793          	mv	a5,a3
    22fc:	02e90c63          	beq	s2,a4,2334 <matrix_test+0x390>
    2300:	00072683          	lw	a3,0(a4)
    2304:	01051513          	slli	a0,a0,0x10
    2308:	01055513          	srli	a0,a0,0x10
    230c:	00d7a7b3          	slt	a5,a5,a3
    2310:	00d60633          	add	a2,a2,a3
    2314:	00a50593          	addi	a1,a0,10
    2318:	00f50533          	add	a0,a0,a5
    231c:	fccac6e3          	blt	s5,a2,22e8 <matrix_test+0x344>
    2320:	01051513          	slli	a0,a0,0x10
    2324:	00470713          	addi	a4,a4,4
    2328:	41055513          	srai	a0,a0,0x10
    232c:	00068793          	mv	a5,a3
    2330:	fce918e3          	bne	s2,a4,2300 <matrix_test+0x35c>
    2334:	00188893          	addi	a7,a7,1
    2338:	41030933          	sub	s2,t1,a6
    233c:	fb1a10e3          	bne	s4,a7,22dc <matrix_test+0x338>
    2340:	000b8593          	mv	a1,s7
    2344:	561000ef          	jal	ra,30a4 <crc16>
    2348:	00f00793          	li	a5,15
    234c:	00050913          	mv	s2,a0
    2350:	2e97f463          	bgeu	a5,s1,2638 <matrix_test+0x694>
    2354:	001a1593          	slli	a1,s4,0x1
    2358:	00000613          	li	a2,0
    235c:	00040793          	mv	a5,s0
    2360:	00000693          	li	a3,0
    2364:	0007d703          	lhu	a4,0(a5)
    2368:	00278793          	addi	a5,a5,2
    236c:	00168693          	addi	a3,a3,1
    2370:	41670733          	sub	a4,a4,s6
    2374:	fee79f23          	sh	a4,-2(a5)
    2378:	ff46e6e3          	bltu	a3,s4,2364 <matrix_test+0x3c0>
    237c:	00160613          	addi	a2,a2,1
    2380:	00b40433          	add	s0,s0,a1
    2384:	fd466ce3          	bltu	a2,s4,235c <matrix_test+0x3b8>
    2388:	00f00793          	li	a5,15
    238c:	1297f463          	bgeu	a5,s1,24b4 <matrix_test+0x510>
    2390:	02c12083          	lw	ra,44(sp)
    2394:	02812403          	lw	s0,40(sp)
    2398:	01091513          	slli	a0,s2,0x10
    239c:	02412483          	lw	s1,36(sp)
    23a0:	02012903          	lw	s2,32(sp)
    23a4:	01c12983          	lw	s3,28(sp)
    23a8:	01812a03          	lw	s4,24(sp)
    23ac:	01412a83          	lw	s5,20(sp)
    23b0:	01012b03          	lw	s6,16(sp)
    23b4:	00c12b83          	lw	s7,12(sp)
    23b8:	00812c03          	lw	s8,8(sp)
    23bc:	41055513          	srai	a0,a0,0x10
    23c0:	03010113          	addi	sp,sp,48
    23c4:	00008067          	ret
    23c8:	00003517          	auipc	a0,0x3
    23cc:	39050513          	addi	a0,a0,912 # 5758 <state_known_crc+0xc8>
    23d0:	12c010ef          	jal	ra,34fc <ee_printf>
    23d4:	00003517          	auipc	a0,0x3
    23d8:	3a050513          	addi	a0,a0,928 # 5774 <state_known_crc+0xe4>
    23dc:	120010ef          	jal	ra,34fc <ee_printf>
    23e0:	c60a1ee3          	bnez	s4,205c <matrix_test+0xb8>
    23e4:	00f00793          	li	a5,15
    23e8:	0e97f063          	bgeu	a5,s1,24c8 <matrix_test+0x524>
    23ec:	00000593          	li	a1,0
    23f0:	00000513          	li	a0,0
    23f4:	4b1000ef          	jal	ra,30a4 <crc16>
    23f8:	00050c13          	mv	s8,a0
    23fc:	00098693          	mv	a3,s3
    2400:	00040613          	mv	a2,s0
    2404:	00090593          	mv	a1,s2
    2408:	00000513          	li	a0,0
    240c:	a1dff0ef          	jal	ra,1e28 <matrix_mul_vect>
    2410:	000c0593          	mv	a1,s8
    2414:	00000513          	li	a0,0
    2418:	48d000ef          	jal	ra,30a4 <crc16>
    241c:	00050b93          	mv	s7,a0
    2420:	00098693          	mv	a3,s3
    2424:	00040613          	mv	a2,s0
    2428:	00090593          	mv	a1,s2
    242c:	00000513          	li	a0,0
    2430:	a49ff0ef          	jal	ra,1e78 <matrix_mul_matrix>
    2434:	000b8593          	mv	a1,s7
    2438:	00000513          	li	a0,0
    243c:	469000ef          	jal	ra,30a4 <crc16>
    2440:	00050b93          	mv	s7,a0
    2444:	e5dff06f          	j	22a0 <matrix_test+0x2fc>
    2448:	010a9693          	slli	a3,s5,0x10
    244c:	00050593          	mv	a1,a0
    2450:	0106d693          	srli	a3,a3,0x10
    2454:	000b0613          	mv	a2,s6
    2458:	00003517          	auipc	a0,0x3
    245c:	2b450513          	addi	a0,a0,692 # 570c <state_known_crc+0x7c>
    2460:	09c010ef          	jal	ra,34fc <ee_printf>
    2464:	000ba783          	lw	a5,0(s7)
    2468:	00003517          	auipc	a0,0x3
    246c:	2d450513          	addi	a0,a0,724 # 573c <state_known_crc+0xac>
    2470:	00178793          	addi	a5,a5,1
    2474:	fef1a023          	sw	a5,-32(gp) # 6830 <g_matrix_test_log_count>
    2478:	084010ef          	jal	ra,34fc <ee_printf>
    247c:	b91ff06f          	j	200c <matrix_test+0x68>
    2480:	000b8593          	mv	a1,s7
    2484:	00000513          	li	a0,0
    2488:	41d000ef          	jal	ra,30a4 <crc16>
    248c:	00f00793          	li	a5,15
    2490:	00050913          	mv	s2,a0
    2494:	ee97eee3          	bltu	a5,s1,2390 <matrix_test+0x3ec>
    2498:	00090593          	mv	a1,s2
    249c:	00003517          	auipc	a0,0x3
    24a0:	47850513          	addi	a0,a0,1144 # 5914 <state_known_crc+0x284>
    24a4:	058010ef          	jal	ra,34fc <ee_printf>
    24a8:	00003517          	auipc	a0,0x3
    24ac:	48c50513          	addi	a0,a0,1164 # 5934 <state_known_crc+0x2a4>
    24b0:	04c010ef          	jal	ra,34fc <ee_printf>
    24b4:	00090593          	mv	a1,s2
    24b8:	00003517          	auipc	a0,0x3
    24bc:	43c50513          	addi	a0,a0,1084 # 58f4 <state_known_crc+0x264>
    24c0:	03c010ef          	jal	ra,34fc <ee_printf>
    24c4:	ecdff06f          	j	2390 <matrix_test+0x3ec>
    24c8:	00003517          	auipc	a0,0x3
    24cc:	2c450513          	addi	a0,a0,708 # 578c <state_known_crc+0xfc>
    24d0:	02c010ef          	jal	ra,34fc <ee_printf>
    24d4:	00003517          	auipc	a0,0x3
    24d8:	2d050513          	addi	a0,a0,720 # 57a4 <state_known_crc+0x114>
    24dc:	020010ef          	jal	ra,34fc <ee_printf>
    24e0:	00000593          	li	a1,0
    24e4:	00000513          	li	a0,0
    24e8:	3bd000ef          	jal	ra,30a4 <crc16>
    24ec:	00050593          	mv	a1,a0
    24f0:	00050c13          	mv	s8,a0
    24f4:	00003517          	auipc	a0,0x3
    24f8:	2c450513          	addi	a0,a0,708 # 57b8 <state_known_crc+0x128>
    24fc:	000010ef          	jal	ra,34fc <ee_printf>
    2500:	00003517          	auipc	a0,0x3
    2504:	2d850513          	addi	a0,a0,728 # 57d8 <state_known_crc+0x148>
    2508:	7f5000ef          	jal	ra,34fc <ee_printf>
    250c:	00098693          	mv	a3,s3
    2510:	00040613          	mv	a2,s0
    2514:	00090593          	mv	a1,s2
    2518:	00000513          	li	a0,0
    251c:	90dff0ef          	jal	ra,1e28 <matrix_mul_vect>
    2520:	00003517          	auipc	a0,0x3
    2524:	2d050513          	addi	a0,a0,720 # 57f0 <state_known_crc+0x160>
    2528:	7d5000ef          	jal	ra,34fc <ee_printf>
    252c:	00003517          	auipc	a0,0x3
    2530:	2dc50513          	addi	a0,a0,732 # 5808 <state_known_crc+0x178>
    2534:	7c9000ef          	jal	ra,34fc <ee_printf>
    2538:	000c0593          	mv	a1,s8
    253c:	00000513          	li	a0,0
    2540:	365000ef          	jal	ra,30a4 <crc16>
    2544:	00050593          	mv	a1,a0
    2548:	00050b93          	mv	s7,a0
    254c:	00003517          	auipc	a0,0x3
    2550:	2d050513          	addi	a0,a0,720 # 581c <state_known_crc+0x18c>
    2554:	7a9000ef          	jal	ra,34fc <ee_printf>
    2558:	00003517          	auipc	a0,0x3
    255c:	2e450513          	addi	a0,a0,740 # 583c <state_known_crc+0x1ac>
    2560:	79d000ef          	jal	ra,34fc <ee_printf>
    2564:	00098693          	mv	a3,s3
    2568:	00040613          	mv	a2,s0
    256c:	00090593          	mv	a1,s2
    2570:	00000513          	li	a0,0
    2574:	905ff0ef          	jal	ra,1e78 <matrix_mul_matrix>
    2578:	00003517          	auipc	a0,0x3
    257c:	2e050513          	addi	a0,a0,736 # 5858 <state_known_crc+0x1c8>
    2580:	77d000ef          	jal	ra,34fc <ee_printf>
    2584:	00003517          	auipc	a0,0x3
    2588:	2ec50513          	addi	a0,a0,748 # 5870 <state_known_crc+0x1e0>
    258c:	771000ef          	jal	ra,34fc <ee_printf>
    2590:	000b8593          	mv	a1,s7
    2594:	00000513          	li	a0,0
    2598:	30d000ef          	jal	ra,30a4 <crc16>
    259c:	00050b93          	mv	s7,a0
    25a0:	000b8593          	mv	a1,s7
    25a4:	00003517          	auipc	a0,0x3
    25a8:	2e050513          	addi	a0,a0,736 # 5884 <state_known_crc+0x1f4>
    25ac:	751000ef          	jal	ra,34fc <ee_printf>
    25b0:	00003517          	auipc	a0,0x3
    25b4:	2f450513          	addi	a0,a0,756 # 58a4 <state_known_crc+0x214>
    25b8:	745000ef          	jal	ra,34fc <ee_printf>
    25bc:	00098693          	mv	a3,s3
    25c0:	00040613          	mv	a2,s0
    25c4:	00090593          	mv	a1,s2
    25c8:	000a0513          	mv	a0,s4
    25cc:	939ff0ef          	jal	ra,1f04 <matrix_mul_matrix_bitextract>
    25d0:	00003517          	auipc	a0,0x3
    25d4:	2f450513          	addi	a0,a0,756 # 58c4 <state_known_crc+0x234>
    25d8:	725000ef          	jal	ra,34fc <ee_printf>
    25dc:	00003517          	auipc	a0,0x3
    25e0:	30450513          	addi	a0,a0,772 # 58e0 <state_known_crc+0x250>
    25e4:	719000ef          	jal	ra,34fc <ee_printf>
    25e8:	ccdff06f          	j	22b4 <matrix_test+0x310>
    25ec:	00050593          	mv	a1,a0
    25f0:	00003517          	auipc	a0,0x3
    25f4:	22c50513          	addi	a0,a0,556 # 581c <state_known_crc+0x18c>
    25f8:	705000ef          	jal	ra,34fc <ee_printf>
    25fc:	00003517          	auipc	a0,0x3
    2600:	24050513          	addi	a0,a0,576 # 583c <state_known_crc+0x1ac>
    2604:	6f9000ef          	jal	ra,34fc <ee_printf>
    2608:	00098693          	mv	a3,s3
    260c:	00040613          	mv	a2,s0
    2610:	00090593          	mv	a1,s2
    2614:	000a0513          	mv	a0,s4
    2618:	861ff0ef          	jal	ra,1e78 <matrix_mul_matrix>
    261c:	00003517          	auipc	a0,0x3
    2620:	23c50513          	addi	a0,a0,572 # 5858 <state_known_crc+0x1c8>
    2624:	6d9000ef          	jal	ra,34fc <ee_printf>
    2628:	00003517          	auipc	a0,0x3
    262c:	24850513          	addi	a0,a0,584 # 5870 <state_known_crc+0x1e0>
    2630:	6cd000ef          	jal	ra,34fc <ee_printf>
    2634:	bd9ff06f          	j	220c <matrix_test+0x268>
    2638:	00050593          	mv	a1,a0
    263c:	00003517          	auipc	a0,0x3
    2640:	2d850513          	addi	a0,a0,728 # 5914 <state_known_crc+0x284>
    2644:	6b9000ef          	jal	ra,34fc <ee_printf>
    2648:	00003517          	auipc	a0,0x3
    264c:	2ec50513          	addi	a0,a0,748 # 5934 <state_known_crc+0x2a4>
    2650:	6ad000ef          	jal	ra,34fc <ee_printf>
    2654:	d01ff06f          	j	2354 <matrix_test+0x3b0>
    2658:	00050593          	mv	a1,a0
    265c:	00003517          	auipc	a0,0x3
    2660:	15c50513          	addi	a0,a0,348 # 57b8 <state_known_crc+0x128>
    2664:	699000ef          	jal	ra,34fc <ee_printf>
    2668:	00003517          	auipc	a0,0x3
    266c:	17050513          	addi	a0,a0,368 # 57d8 <state_known_crc+0x148>
    2670:	68d000ef          	jal	ra,34fc <ee_printf>
    2674:	00098693          	mv	a3,s3
    2678:	00040613          	mv	a2,s0
    267c:	00090593          	mv	a1,s2
    2680:	000a0513          	mv	a0,s4
    2684:	fa4ff0ef          	jal	ra,1e28 <matrix_mul_vect>
    2688:	00003517          	auipc	a0,0x3
    268c:	16850513          	addi	a0,a0,360 # 57f0 <state_known_crc+0x160>
    2690:	66d000ef          	jal	ra,34fc <ee_printf>
    2694:	00003517          	auipc	a0,0x3
    2698:	17450513          	addi	a0,a0,372 # 5808 <state_known_crc+0x178>
    269c:	661000ef          	jal	ra,34fc <ee_printf>
    26a0:	ac0a12e3          	bnez	s4,2164 <matrix_test+0x1c0>
    26a4:	e95ff06f          	j	2538 <matrix_test+0x594>
    26a8:	00003517          	auipc	a0,0x3
    26ac:	0e450513          	addi	a0,a0,228 # 578c <state_known_crc+0xfc>
    26b0:	64d000ef          	jal	ra,34fc <ee_printf>
    26b4:	00003517          	auipc	a0,0x3
    26b8:	0f050513          	addi	a0,a0,240 # 57a4 <state_known_crc+0x114>
    26bc:	641000ef          	jal	ra,34fc <ee_printf>
    26c0:	9f9ff06f          	j	20b8 <matrix_test+0x114>

000026c4 <core_bench_matrix>:
    26c4:	fe010113          	addi	sp,sp,-32
    26c8:	01612023          	sw	s6,0(sp)
    26cc:	fdc18b13          	addi	s6,gp,-36 # 682c <g_matrix_bench_log_count>
    26d0:	000b2783          	lw	a5,0(s6)
    26d4:	00812c23          	sw	s0,24(sp)
    26d8:	00912a23          	sw	s1,20(sp)
    26dc:	01212823          	sw	s2,16(sp)
    26e0:	01312623          	sw	s3,12(sp)
    26e4:	01412423          	sw	s4,8(sp)
    26e8:	01512223          	sw	s5,4(sp)
    26ec:	00112e23          	sw	ra,28(sp)
    26f0:	00f00713          	li	a4,15
    26f4:	00058a93          	mv	s5,a1
    26f8:	00060413          	mv	s0,a2
    26fc:	00052483          	lw	s1,0(a0)
    2700:	00c52903          	lw	s2,12(a0)
    2704:	00452983          	lw	s3,4(a0)
    2708:	00852a03          	lw	s4,8(a0)
    270c:	04f77863          	bgeu	a4,a5,275c <core_bench_matrix+0x98>
    2710:	00178793          	addi	a5,a5,1
    2714:	00058713          	mv	a4,a1
    2718:	000a0693          	mv	a3,s4
    271c:	00090593          	mv	a1,s2
    2720:	00098613          	mv	a2,s3
    2724:	00048513          	mv	a0,s1
    2728:	fcf1ae23          	sw	a5,-36(gp) # 682c <g_matrix_bench_log_count>
    272c:	879ff0ef          	jal	ra,1fa4 <matrix_test>
    2730:	00040593          	mv	a1,s0
    2734:	01812403          	lw	s0,24(sp)
    2738:	01c12083          	lw	ra,28(sp)
    273c:	01412483          	lw	s1,20(sp)
    2740:	01012903          	lw	s2,16(sp)
    2744:	00c12983          	lw	s3,12(sp)
    2748:	00812a03          	lw	s4,8(sp)
    274c:	00412a83          	lw	s5,4(sp)
    2750:	00012b03          	lw	s6,0(sp)
    2754:	02010113          	addi	sp,sp,32
    2758:	14d0006f          	j	30a4 <crc16>
    275c:	00060693          	mv	a3,a2
    2760:	01059613          	slli	a2,a1,0x10
    2764:	00090813          	mv	a6,s2
    2768:	000a0793          	mv	a5,s4
    276c:	00098713          	mv	a4,s3
    2770:	00048593          	mv	a1,s1
    2774:	01065613          	srli	a2,a2,0x10
    2778:	00003517          	auipc	a0,0x3
    277c:	f2450513          	addi	a0,a0,-220 # 569c <state_known_crc+0xc>
    2780:	57d000ef          	jal	ra,34fc <ee_printf>
    2784:	000b2783          	lw	a5,0(s6)
    2788:	000a8713          	mv	a4,s5
    278c:	000a0693          	mv	a3,s4
    2790:	00178793          	addi	a5,a5,1
    2794:	00098613          	mv	a2,s3
    2798:	00090593          	mv	a1,s2
    279c:	00048513          	mv	a0,s1
    27a0:	fcf1ae23          	sw	a5,-36(gp) # 682c <g_matrix_bench_log_count>
    27a4:	801ff0ef          	jal	ra,1fa4 <matrix_test>
    27a8:	00040593          	mv	a1,s0
    27ac:	0f9000ef          	jal	ra,30a4 <crc16>
    27b0:	00050413          	mv	s0,a0
    27b4:	00050593          	mv	a1,a0
    27b8:	00003517          	auipc	a0,0x3
    27bc:	f3450513          	addi	a0,a0,-204 # 56ec <state_known_crc+0x5c>
    27c0:	53d000ef          	jal	ra,34fc <ee_printf>
    27c4:	00040513          	mv	a0,s0
    27c8:	01c12083          	lw	ra,28(sp)
    27cc:	01812403          	lw	s0,24(sp)
    27d0:	01412483          	lw	s1,20(sp)
    27d4:	01012903          	lw	s2,16(sp)
    27d8:	00c12983          	lw	s3,12(sp)
    27dc:	00812a03          	lw	s4,8(sp)
    27e0:	00412a83          	lw	s5,4(sp)
    27e4:	00012b03          	lw	s6,0(sp)
    27e8:	02010113          	addi	sp,sp,32
    27ec:	00008067          	ret

000027f0 <core_init_state>:
    27f0:	ff010113          	addi	sp,sp,-16
    27f4:	00000713          	li	a4,0
    27f8:	00000693          	li	a3,0
    27fc:	00812623          	sw	s0,12(sp)
    2800:	00158593          	addi	a1,a1,1
    2804:	00e68433          	add	s0,a3,a4
    2808:	00912423          	sw	s1,8(sp)
    280c:	01059593          	slli	a1,a1,0x10
    2810:	fff50893          	addi	a7,a0,-1
    2814:	00140493          	addi	s1,s0,1
    2818:	0105d593          	srli	a1,a1,0x10
    281c:	00000793          	li	a5,0
    2820:	02c00e13          	li	t3,44
    2824:	00400313          	li	t1,4
    2828:	00003297          	auipc	t0,0x3
    282c:	2c428293          	addi	t0,t0,708 # 5aec <intpat>
    2830:	00003817          	auipc	a6,0x3
    2834:	12480813          	addi	a6,a6,292 # 5954 <state_known_crc+0x2c4>
    2838:	00003f97          	auipc	t6,0x3
    283c:	294f8f93          	addi	t6,t6,660 # 5acc <errpat>
    2840:	00003f17          	auipc	t5,0x3
    2844:	2bcf0f13          	addi	t5,t5,700 # 5afc <scipat>
    2848:	00003e97          	auipc	t4,0x3
    284c:	294e8e93          	addi	t4,t4,660 # 5adc <floatpat>
    2850:	0714f063          	bgeu	s1,a7,28b0 <core_init_state+0xc0>
    2854:	0a071263          	bnez	a4,28f8 <core_init_state+0x108>
    2858:	0075f793          	andi	a5,a1,7
    285c:	ffd78793          	addi	a5,a5,-3
    2860:	01079793          	slli	a5,a5,0x10
    2864:	0035d713          	srli	a4,a1,0x3
    2868:	0107d793          	srli	a5,a5,0x10
    286c:	00377713          	andi	a4,a4,3
    2870:	0cf36663          	bltu	t1,a5,293c <core_init_state+0x14c>
    2874:	00279793          	slli	a5,a5,0x2
    2878:	010787b3          	add	a5,a5,a6
    287c:	0007a783          	lw	a5,0(a5)
    2880:	00271713          	slli	a4,a4,0x2
    2884:	010787b3          	add	a5,a5,a6
    2888:	00078067          	jr	a5
    288c:	00ee8733          	add	a4,t4,a4
    2890:	00072783          	lw	a5,0(a4)
    2894:	00800713          	li	a4,8
    2898:	00158593          	addi	a1,a1,1
    289c:	00e68433          	add	s0,a3,a4
    28a0:	01059593          	slli	a1,a1,0x10
    28a4:	00140493          	addi	s1,s0,1
    28a8:	0105d593          	srli	a1,a1,0x10
    28ac:	fb14e4e3          	bltu	s1,a7,2854 <core_init_state+0x64>
    28b0:	00d607b3          	add	a5,a2,a3
    28b4:	00a60633          	add	a2,a2,a0
    28b8:	00a6f863          	bgeu	a3,a0,28c8 <core_init_state+0xd8>
    28bc:	00078023          	sb	zero,0(a5)
    28c0:	00178793          	addi	a5,a5,1
    28c4:	fef61ce3          	bne	a2,a5,28bc <core_init_state+0xcc>
    28c8:	00c12403          	lw	s0,12(sp)
    28cc:	00812483          	lw	s1,8(sp)
    28d0:	01010113          	addi	sp,sp,16
    28d4:	00008067          	ret
    28d8:	00ef0733          	add	a4,t5,a4
    28dc:	00072783          	lw	a5,0(a4)
    28e0:	00800713          	li	a4,8
    28e4:	fb5ff06f          	j	2898 <core_init_state+0xa8>
    28e8:	00ef8733          	add	a4,t6,a4
    28ec:	00072783          	lw	a5,0(a4)
    28f0:	00800713          	li	a4,8
    28f4:	fa5ff06f          	j	2898 <core_init_state+0xa8>
    28f8:	00d606b3          	add	a3,a2,a3
    28fc:	00e78733          	add	a4,a5,a4
    2900:	0007c383          	lbu	t2,0(a5)
    2904:	00168693          	addi	a3,a3,1
    2908:	00178793          	addi	a5,a5,1
    290c:	fe768fa3          	sb	t2,-1(a3)
    2910:	fef718e3          	bne	a4,a5,2900 <core_init_state+0x110>
    2914:	0075f793          	andi	a5,a1,7
    2918:	ffd78793          	addi	a5,a5,-3
    291c:	00860433          	add	s0,a2,s0
    2920:	01079793          	slli	a5,a5,0x10
    2924:	0035d713          	srli	a4,a1,0x3
    2928:	01c40023          	sb	t3,0(s0)
    292c:	0107d793          	srli	a5,a5,0x10
    2930:	00048693          	mv	a3,s1
    2934:	00377713          	andi	a4,a4,3
    2938:	f2f37ee3          	bgeu	t1,a5,2874 <core_init_state+0x84>
    293c:	00271713          	slli	a4,a4,0x2
    2940:	00e28733          	add	a4,t0,a4
    2944:	00072783          	lw	a5,0(a4)
    2948:	00400713          	li	a4,4
    294c:	f4dff06f          	j	2898 <core_init_state+0xa8>

00002950 <core_state_transition>:
    2950:	00052783          	lw	a5,0(a0)
    2954:	0007c683          	lbu	a3,0(a5)
    2958:	2e068863          	beqz	a3,2c48 <core_state_transition+0x2f8>
    295c:	02c00813          	li	a6,44
    2960:	00178713          	addi	a4,a5,1
    2964:	2b068e63          	beq	a3,a6,2c20 <core_state_transition+0x2d0>
    2968:	0005a883          	lw	a7,0(a1)
    296c:	fd068613          	addi	a2,a3,-48
    2970:	0ff67613          	andi	a2,a2,255
    2974:	00900313          	li	t1,9
    2978:	00188893          	addi	a7,a7,1
    297c:	0ac36c63          	bltu	t1,a2,2a34 <core_state_transition+0xe4>
    2980:	0115a023          	sw	a7,0(a1)
    2984:	0017c683          	lbu	a3,1(a5)
    2988:	16068463          	beqz	a3,2af0 <core_state_transition+0x1a0>
    298c:	00278793          	addi	a5,a5,2
    2990:	15068e63          	beq	a3,a6,2aec <core_state_transition+0x19c>
    2994:	fd068613          	addi	a2,a3,-48
    2998:	02e00813          	li	a6,46
    299c:	00900893          	li	a7,9
    29a0:	02c00313          	li	t1,44
    29a4:	0ff67613          	andi	a2,a2,255
    29a8:	03068663          	beq	a3,a6,29d4 <core_state_transition+0x84>
    29ac:	0cc8e063          	bltu	a7,a2,2a6c <core_state_transition+0x11c>
    29b0:	00174683          	lbu	a3,1(a4)
    29b4:	00178613          	addi	a2,a5,1
    29b8:	00078713          	mv	a4,a5
    29bc:	12068863          	beqz	a3,2aec <core_state_transition+0x19c>
    29c0:	2a668a63          	beq	a3,t1,2c74 <core_state_transition+0x324>
    29c4:	00060793          	mv	a5,a2
    29c8:	fd068613          	addi	a2,a3,-48
    29cc:	0ff67613          	andi	a2,a2,255
    29d0:	fd069ee3          	bne	a3,a6,29ac <core_state_transition+0x5c>
    29d4:	0105a683          	lw	a3,16(a1)
    29d8:	00168693          	addi	a3,a3,1
    29dc:	00d5a823          	sw	a3,16(a1)
    29e0:	00174683          	lbu	a3,1(a4)
    29e4:	28068263          	beqz	a3,2c68 <core_state_transition+0x318>
    29e8:	02c00713          	li	a4,44
    29ec:	00178613          	addi	a2,a5,1
    29f0:	22e68263          	beq	a3,a4,2c14 <core_state_transition+0x2c4>
    29f4:	04500813          	li	a6,69
    29f8:	00900893          	li	a7,9
    29fc:	02c00313          	li	t1,44
    2a00:	fd068713          	addi	a4,a3,-48
    2a04:	0df6f693          	andi	a3,a3,223
    2a08:	0ff77713          	andi	a4,a4,255
    2a0c:	0f068663          	beq	a3,a6,2af8 <core_state_transition+0x1a8>
    2a10:	1ae8fa63          	bgeu	a7,a4,2bc4 <core_state_transition+0x274>
    2a14:	0145a683          	lw	a3,20(a1)
    2a18:	00060713          	mv	a4,a2
    2a1c:	00100793          	li	a5,1
    2a20:	00168693          	addi	a3,a3,1
    2a24:	00d5aa23          	sw	a3,20(a1)
    2a28:	00e52023          	sw	a4,0(a0)
    2a2c:	00078513          	mv	a0,a5
    2a30:	00008067          	ret
    2a34:	02b00613          	li	a2,43
    2a38:	04c68a63          	beq	a3,a2,2a8c <core_state_transition+0x13c>
    2a3c:	02d00613          	li	a2,45
    2a40:	04c68663          	beq	a3,a2,2a8c <core_state_transition+0x13c>
    2a44:	02e00613          	li	a2,46
    2a48:	18c68c63          	beq	a3,a2,2be0 <core_state_transition+0x290>
    2a4c:	0045a683          	lw	a3,4(a1)
    2a50:	0115a023          	sw	a7,0(a1)
    2a54:	00100793          	li	a5,1
    2a58:	00168693          	addi	a3,a3,1
    2a5c:	00d5a223          	sw	a3,4(a1)
    2a60:	00e52023          	sw	a4,0(a0)
    2a64:	00078513          	mv	a0,a5
    2a68:	00008067          	ret
    2a6c:	0105a683          	lw	a3,16(a1)
    2a70:	00078713          	mv	a4,a5
    2a74:	00100793          	li	a5,1
    2a78:	00168693          	addi	a3,a3,1
    2a7c:	00d5a823          	sw	a3,16(a1)
    2a80:	00e52023          	sw	a4,0(a0)
    2a84:	00078513          	mv	a0,a5
    2a88:	00008067          	ret
    2a8c:	0115a023          	sw	a7,0(a1)
    2a90:	0017c883          	lbu	a7,1(a5)
    2a94:	1c088063          	beqz	a7,2c54 <core_state_transition+0x304>
    2a98:	00278713          	addi	a4,a5,2
    2a9c:	1b088c63          	beq	a7,a6,2c54 <core_state_transition+0x304>
    2aa0:	0085a603          	lw	a2,8(a1)
    2aa4:	fd088693          	addi	a3,a7,-48
    2aa8:	0ff6f693          	andi	a3,a3,255
    2aac:	00900813          	li	a6,9
    2ab0:	00160613          	addi	a2,a2,1
    2ab4:	02d87063          	bgeu	a6,a3,2ad4 <core_state_transition+0x184>
    2ab8:	02e00693          	li	a3,46
    2abc:	14d88063          	beq	a7,a3,2bfc <core_state_transition+0x2ac>
    2ac0:	00c5a423          	sw	a2,8(a1)
    2ac4:	00100793          	li	a5,1
    2ac8:	00e52023          	sw	a4,0(a0)
    2acc:	00078513          	mv	a0,a5
    2ad0:	00008067          	ret
    2ad4:	00c5a423          	sw	a2,8(a1)
    2ad8:	0027c683          	lbu	a3,2(a5)
    2adc:	00068a63          	beqz	a3,2af0 <core_state_transition+0x1a0>
    2ae0:	02c00613          	li	a2,44
    2ae4:	00170793          	addi	a5,a4,1
    2ae8:	eac696e3          	bne	a3,a2,2994 <core_state_transition+0x44>
    2aec:	00078713          	mv	a4,a5
    2af0:	00400793          	li	a5,4
    2af4:	f8dff06f          	j	2a80 <core_state_transition+0x130>
    2af8:	0145a703          	lw	a4,20(a1)
    2afc:	00170713          	addi	a4,a4,1
    2b00:	00e5aa23          	sw	a4,20(a1)
    2b04:	0017c783          	lbu	a5,1(a5)
    2b08:	12078a63          	beqz	a5,2c3c <core_state_transition+0x2ec>
    2b0c:	02c00813          	li	a6,44
    2b10:	00160713          	addi	a4,a2,1
    2b14:	13078663          	beq	a5,a6,2c40 <core_state_transition+0x2f0>
    2b18:	00c5a683          	lw	a3,12(a1)
    2b1c:	fd578793          	addi	a5,a5,-43
    2b20:	0fd7f793          	andi	a5,a5,253
    2b24:	00168693          	addi	a3,a3,1
    2b28:	00d5a623          	sw	a3,12(a1)
    2b2c:	00078a63          	beqz	a5,2b40 <core_state_transition+0x1f0>
    2b30:	00100793          	li	a5,1
    2b34:	00e52023          	sw	a4,0(a0)
    2b38:	00078513          	mv	a0,a5
    2b3c:	00008067          	ret
    2b40:	00164783          	lbu	a5,1(a2)
    2b44:	0e078863          	beqz	a5,2c34 <core_state_transition+0x2e4>
    2b48:	00260713          	addi	a4,a2,2
    2b4c:	0f078463          	beq	a5,a6,2c34 <core_state_transition+0x2e4>
    2b50:	0185a683          	lw	a3,24(a1)
    2b54:	fd078793          	addi	a5,a5,-48
    2b58:	0ff7f793          	andi	a5,a5,255
    2b5c:	00168693          	addi	a3,a3,1
    2b60:	00900893          	li	a7,9
    2b64:	00d5ac23          	sw	a3,24(a1)
    2b68:	fcf8e4e3          	bltu	a7,a5,2b30 <core_state_transition+0x1e0>
    2b6c:	00264683          	lbu	a3,2(a2)
    2b70:	0a068e63          	beqz	a3,2c2c <core_state_transition+0x2dc>
    2b74:	00360793          	addi	a5,a2,3
    2b78:	0b068863          	beq	a3,a6,2c28 <core_state_transition+0x2d8>
    2b7c:	00900613          	li	a2,9
    2b80:	02c00893          	li	a7,44
    2b84:	fd068693          	addi	a3,a3,-48
    2b88:	0ff6f693          	andi	a3,a3,255
    2b8c:	00d67e63          	bgeu	a2,a3,2ba8 <core_state_transition+0x258>
    2b90:	0045a683          	lw	a3,4(a1)
    2b94:	00078713          	mv	a4,a5
    2b98:	00100793          	li	a5,1
    2b9c:	00168693          	addi	a3,a3,1
    2ba0:	00d5a223          	sw	a3,4(a1)
    2ba4:	eddff06f          	j	2a80 <core_state_transition+0x130>
    2ba8:	00174683          	lbu	a3,1(a4)
    2bac:	00178813          	addi	a6,a5,1
    2bb0:	00078713          	mv	a4,a5
    2bb4:	06068a63          	beqz	a3,2c28 <core_state_transition+0x2d8>
    2bb8:	0b168263          	beq	a3,a7,2c5c <core_state_transition+0x30c>
    2bbc:	00080793          	mv	a5,a6
    2bc0:	fc5ff06f          	j	2b84 <core_state_transition+0x234>
    2bc4:	0017c683          	lbu	a3,1(a5)
    2bc8:	00160713          	addi	a4,a2,1
    2bcc:	00060793          	mv	a5,a2
    2bd0:	04068263          	beqz	a3,2c14 <core_state_transition+0x2c4>
    2bd4:	04668263          	beq	a3,t1,2c18 <core_state_transition+0x2c8>
    2bd8:	00070613          	mv	a2,a4
    2bdc:	e25ff06f          	j	2a00 <core_state_transition+0xb0>
    2be0:	0115a023          	sw	a7,0(a1)
    2be4:	0017c683          	lbu	a3,1(a5)
    2be8:	02068863          	beqz	a3,2c18 <core_state_transition+0x2c8>
    2bec:	00278613          	addi	a2,a5,2
    2bf0:	03068263          	beq	a3,a6,2c14 <core_state_transition+0x2c4>
    2bf4:	00070793          	mv	a5,a4
    2bf8:	dfdff06f          	j	29f4 <core_state_transition+0xa4>
    2bfc:	00c5a423          	sw	a2,8(a1)
    2c00:	0027c683          	lbu	a3,2(a5)
    2c04:	00068a63          	beqz	a3,2c18 <core_state_transition+0x2c8>
    2c08:	02c00793          	li	a5,44
    2c0c:	00170613          	addi	a2,a4,1
    2c10:	fef692e3          	bne	a3,a5,2bf4 <core_state_transition+0x2a4>
    2c14:	00060713          	mv	a4,a2
    2c18:	00500793          	li	a5,5
    2c1c:	e65ff06f          	j	2a80 <core_state_transition+0x130>
    2c20:	00000793          	li	a5,0
    2c24:	e5dff06f          	j	2a80 <core_state_transition+0x130>
    2c28:	00078713          	mv	a4,a5
    2c2c:	00700793          	li	a5,7
    2c30:	e51ff06f          	j	2a80 <core_state_transition+0x130>
    2c34:	00600793          	li	a5,6
    2c38:	e49ff06f          	j	2a80 <core_state_transition+0x130>
    2c3c:	00060713          	mv	a4,a2
    2c40:	00300793          	li	a5,3
    2c44:	e3dff06f          	j	2a80 <core_state_transition+0x130>
    2c48:	00078713          	mv	a4,a5
    2c4c:	00000793          	li	a5,0
    2c50:	e31ff06f          	j	2a80 <core_state_transition+0x130>
    2c54:	00200793          	li	a5,2
    2c58:	e29ff06f          	j	2a80 <core_state_transition+0x130>
    2c5c:	00080713          	mv	a4,a6
    2c60:	00700793          	li	a5,7
    2c64:	e1dff06f          	j	2a80 <core_state_transition+0x130>
    2c68:	00078713          	mv	a4,a5
    2c6c:	00500793          	li	a5,5
    2c70:	e11ff06f          	j	2a80 <core_state_transition+0x130>
    2c74:	00060713          	mv	a4,a2
    2c78:	00400793          	li	a5,4
    2c7c:	e05ff06f          	j	2a80 <core_state_transition+0x130>

00002c80 <core_bench_state>:
    2c80:	f8010113          	addi	sp,sp,-128
    2c84:	06912a23          	sw	s1,116(sp)
    2c88:	fe418493          	addi	s1,gp,-28 # 6834 <g_state_log_count>
    2c8c:	07612023          	sw	s6,96(sp)
    2c90:	0004ab03          	lw	s6,0(s1)
    2c94:	06812c23          	sw	s0,120(sp)
    2c98:	07312623          	sw	s3,108(sp)
    2c9c:	07412423          	sw	s4,104(sp)
    2ca0:	07512223          	sw	s5,100(sp)
    2ca4:	05812c23          	sw	s8,88(sp)
    2ca8:	05912a23          	sw	s9,84(sp)
    2cac:	06112e23          	sw	ra,124(sp)
    2cb0:	07212823          	sw	s2,112(sp)
    2cb4:	05712e23          	sw	s7,92(sp)
    2cb8:	00b12623          	sw	a1,12(sp)
    2cbc:	00f00813          	li	a6,15
    2cc0:	00078993          	mv	s3,a5
    2cc4:	00058413          	mv	s0,a1
    2cc8:	00050c93          	mv	s9,a0
    2ccc:	00060c13          	mv	s8,a2
    2cd0:	00068a93          	mv	s5,a3
    2cd4:	00070a13          	mv	s4,a4
    2cd8:	000b0793          	mv	a5,s6
    2cdc:	25687463          	bgeu	a6,s6,2f24 <core_bench_state+0x2a4>
    2ce0:	00178793          	addi	a5,a5,1
    2ce4:	fef1a223          	sw	a5,-28(gp) # 6834 <g_state_log_count>
    2ce8:	01010493          	addi	s1,sp,16
    2cec:	03010913          	addi	s2,sp,48
    2cf0:	05010693          	addi	a3,sp,80
    2cf4:	00048713          	mv	a4,s1
    2cf8:	00090793          	mv	a5,s2
    2cfc:	0007a023          	sw	zero,0(a5)
    2d00:	00072023          	sw	zero,0(a4)
    2d04:	00478793          	addi	a5,a5,4
    2d08:	00470713          	addi	a4,a4,4
    2d0c:	fed798e3          	bne	a5,a3,2cfc <core_bench_state+0x7c>
    2d10:	00f00793          	li	a5,15
    2d14:	0005c603          	lbu	a2,0(a1)
    2d18:	1767f463          	bgeu	a5,s6,2e80 <core_bench_state+0x200>
    2d1c:	04060063          	beqz	a2,2d5c <core_bench_state+0xdc>
    2d20:	00c10b93          	addi	s7,sp,12
    2d24:	03010593          	addi	a1,sp,48
    2d28:	000b8513          	mv	a0,s7
    2d2c:	c25ff0ef          	jal	ra,2950 <core_state_transition>
    2d30:	05010793          	addi	a5,sp,80
    2d34:	00251513          	slli	a0,a0,0x2
    2d38:	00a78533          	add	a0,a5,a0
    2d3c:	00c12583          	lw	a1,12(sp)
    2d40:	fc052783          	lw	a5,-64(a0)
    2d44:	0005c703          	lbu	a4,0(a1)
    2d48:	00178793          	addi	a5,a5,1
    2d4c:	fcf52023          	sw	a5,-64(a0)
    2d50:	fc071ae3          	bnez	a4,2d24 <core_bench_state+0xa4>
    2d54:	00f00793          	li	a5,15
    2d58:	1567f063          	bgeu	a5,s6,2e98 <core_bench_state+0x218>
    2d5c:	00812623          	sw	s0,12(sp)
    2d60:	01940cb3          	add	s9,s0,s9
    2d64:	00040793          	mv	a5,s0
    2d68:	21947663          	bgeu	s0,s9,2f74 <core_bench_state+0x2f4>
    2d6c:	02c00613          	li	a2,44
    2d70:	0007c703          	lbu	a4,0(a5)
    2d74:	018746b3          	xor	a3,a4,s8
    2d78:	00c70463          	beq	a4,a2,2d80 <core_bench_state+0x100>
    2d7c:	00d78023          	sb	a3,0(a5)
    2d80:	00c12783          	lw	a5,12(sp)
    2d84:	014787b3          	add	a5,a5,s4
    2d88:	00f12623          	sw	a5,12(sp)
    2d8c:	ff97e2e3          	bltu	a5,s9,2d70 <core_bench_state+0xf0>
    2d90:	00f00793          	li	a5,15
    2d94:	1367f663          	bgeu	a5,s6,2ec0 <core_bench_state+0x240>
    2d98:	00044783          	lbu	a5,0(s0)
    2d9c:	00812623          	sw	s0,12(sp)
    2da0:	04078263          	beqz	a5,2de4 <core_bench_state+0x164>
    2da4:	00c10b93          	addi	s7,sp,12
    2da8:	03010593          	addi	a1,sp,48
    2dac:	000b8513          	mv	a0,s7
    2db0:	ba1ff0ef          	jal	ra,2950 <core_state_transition>
    2db4:	05010793          	addi	a5,sp,80
    2db8:	00251513          	slli	a0,a0,0x2
    2dbc:	00a78533          	add	a0,a5,a0
    2dc0:	00c12583          	lw	a1,12(sp)
    2dc4:	fc052783          	lw	a5,-64(a0)
    2dc8:	0005c703          	lbu	a4,0(a1)
    2dcc:	00178793          	addi	a5,a5,1
    2dd0:	fcf52023          	sw	a5,-64(a0)
    2dd4:	fc071ae3          	bnez	a4,2da8 <core_bench_state+0x128>
    2dd8:	00f00793          	li	a5,15
    2ddc:	1167fa63          	bgeu	a5,s6,2ef0 <core_bench_state+0x270>
    2de0:	00812623          	sw	s0,12(sp)
    2de4:	03947863          	bgeu	s0,s9,2e14 <core_bench_state+0x194>
    2de8:	02c00693          	li	a3,44
    2dec:	00044783          	lbu	a5,0(s0)
    2df0:	0157c733          	xor	a4,a5,s5
    2df4:	00d78463          	beq	a5,a3,2dfc <core_bench_state+0x17c>
    2df8:	00e40023          	sb	a4,0(s0)
    2dfc:	00c12403          	lw	s0,12(sp)
    2e00:	01440433          	add	s0,s0,s4
    2e04:	00812623          	sw	s0,12(sp)
    2e08:	ff9462e3          	bltu	s0,s9,2dec <core_bench_state+0x16c>
    2e0c:	00f00793          	li	a5,15
    2e10:	1167f263          	bgeu	a5,s6,2f14 <core_bench_state+0x294>
    2e14:	02048413          	addi	s0,s1,32
    2e18:	0004a503          	lw	a0,0(s1)
    2e1c:	00098593          	mv	a1,s3
    2e20:	00448493          	addi	s1,s1,4
    2e24:	24c000ef          	jal	ra,3070 <crcu32>
    2e28:	00050593          	mv	a1,a0
    2e2c:	00092503          	lw	a0,0(s2)
    2e30:	00490913          	addi	s2,s2,4
    2e34:	23c000ef          	jal	ra,3070 <crcu32>
    2e38:	00050993          	mv	s3,a0
    2e3c:	fc849ee3          	bne	s1,s0,2e18 <core_bench_state+0x198>
    2e40:	00f00793          	li	a5,15
    2e44:	1167fe63          	bgeu	a5,s6,2f60 <core_bench_state+0x2e0>
    2e48:	07c12083          	lw	ra,124(sp)
    2e4c:	07812403          	lw	s0,120(sp)
    2e50:	00098513          	mv	a0,s3
    2e54:	07412483          	lw	s1,116(sp)
    2e58:	07012903          	lw	s2,112(sp)
    2e5c:	06c12983          	lw	s3,108(sp)
    2e60:	06812a03          	lw	s4,104(sp)
    2e64:	06412a83          	lw	s5,100(sp)
    2e68:	06012b03          	lw	s6,96(sp)
    2e6c:	05c12b83          	lw	s7,92(sp)
    2e70:	05812c03          	lw	s8,88(sp)
    2e74:	05412c83          	lw	s9,84(sp)
    2e78:	08010113          	addi	sp,sp,128
    2e7c:	00008067          	ret
    2e80:	00003517          	auipc	a0,0x3
    2e84:	b4450513          	addi	a0,a0,-1212 # 59c4 <state_known_crc+0x334>
    2e88:	674000ef          	jal	ra,34fc <ee_printf>
    2e8c:	00c12583          	lw	a1,12(sp)
    2e90:	0005c783          	lbu	a5,0(a1)
    2e94:	e80796e3          	bnez	a5,2d20 <core_bench_state+0xa0>
    2e98:	00003517          	auipc	a0,0x3
    2e9c:	b5850513          	addi	a0,a0,-1192 # 59f0 <state_known_crc+0x360>
    2ea0:	65c000ef          	jal	ra,34fc <ee_printf>
    2ea4:	00003517          	auipc	a0,0x3
    2ea8:	b6850513          	addi	a0,a0,-1176 # 5a0c <state_known_crc+0x37c>
    2eac:	00812623          	sw	s0,12(sp)
    2eb0:	64c000ef          	jal	ra,34fc <ee_printf>
    2eb4:	00c12783          	lw	a5,12(sp)
    2eb8:	01940cb3          	add	s9,s0,s9
    2ebc:	eb97e8e3          	bltu	a5,s9,2d6c <core_bench_state+0xec>
    2ec0:	00003517          	auipc	a0,0x3
    2ec4:	b6450513          	addi	a0,a0,-1180 # 5a24 <state_known_crc+0x394>
    2ec8:	634000ef          	jal	ra,34fc <ee_printf>
    2ecc:	00044603          	lbu	a2,0(s0)
    2ed0:	00040593          	mv	a1,s0
    2ed4:	00003517          	auipc	a0,0x3
    2ed8:	b6450513          	addi	a0,a0,-1180 # 5a38 <state_known_crc+0x3a8>
    2edc:	00812623          	sw	s0,12(sp)
    2ee0:	61c000ef          	jal	ra,34fc <ee_printf>
    2ee4:	00c12583          	lw	a1,12(sp)
    2ee8:	0005c783          	lbu	a5,0(a1)
    2eec:	ea079ce3          	bnez	a5,2da4 <core_bench_state+0x124>
    2ef0:	00003517          	auipc	a0,0x3
    2ef4:	b7450513          	addi	a0,a0,-1164 # 5a64 <state_known_crc+0x3d4>
    2ef8:	604000ef          	jal	ra,34fc <ee_printf>
    2efc:	00003517          	auipc	a0,0x3
    2f00:	b8450513          	addi	a0,a0,-1148 # 5a80 <state_known_crc+0x3f0>
    2f04:	00812623          	sw	s0,12(sp)
    2f08:	5f4000ef          	jal	ra,34fc <ee_printf>
    2f0c:	00c12403          	lw	s0,12(sp)
    2f10:	ed946ce3          	bltu	s0,s9,2de8 <core_bench_state+0x168>
    2f14:	00003517          	auipc	a0,0x3
    2f18:	b8450513          	addi	a0,a0,-1148 # 5a98 <state_known_crc+0x408>
    2f1c:	5e0000ef          	jal	ra,34fc <ee_printf>
    2f20:	ef5ff06f          	j	2e14 <core_bench_state+0x194>
    2f24:	01071793          	slli	a5,a4,0x10
    2f28:	01069713          	slli	a4,a3,0x10
    2f2c:	01061693          	slli	a3,a2,0x10
    2f30:	0107d793          	srli	a5,a5,0x10
    2f34:	00058613          	mv	a2,a1
    2f38:	00098813          	mv	a6,s3
    2f3c:	00050593          	mv	a1,a0
    2f40:	01075713          	srli	a4,a4,0x10
    2f44:	0106d693          	srli	a3,a3,0x10
    2f48:	00003517          	auipc	a0,0x3
    2f4c:	a2050513          	addi	a0,a0,-1504 # 5968 <state_known_crc+0x2d8>
    2f50:	5ac000ef          	jal	ra,34fc <ee_printf>
    2f54:	0004a783          	lw	a5,0(s1)
    2f58:	00c12583          	lw	a1,12(sp)
    2f5c:	d85ff06f          	j	2ce0 <core_bench_state+0x60>
    2f60:	00050593          	mv	a1,a0
    2f64:	00003517          	auipc	a0,0x3
    2f68:	b4850513          	addi	a0,a0,-1208 # 5aac <state_known_crc+0x41c>
    2f6c:	590000ef          	jal	ra,34fc <ee_printf>
    2f70:	ed9ff06f          	j	2e48 <core_bench_state+0x1c8>
    2f74:	00044783          	lbu	a5,0(s0)
    2f78:	e20796e3          	bnez	a5,2da4 <core_bench_state+0x124>
    2f7c:	e91ff06f          	j	2e0c <core_bench_state+0x18c>

00002f80 <get_seed_32>:
    2f80:	00500793          	li	a5,5
    2f84:	06a7e263          	bltu	a5,a0,2fe8 <get_seed_32+0x68>
    2f88:	00003717          	auipc	a4,0x3
    2f8c:	c3470713          	addi	a4,a4,-972 # 5bbc <scipat+0xc0>
    2f90:	00251513          	slli	a0,a0,0x2
    2f94:	00e50533          	add	a0,a0,a4
    2f98:	00052783          	lw	a5,0(a0)
    2f9c:	00e787b3          	add	a5,a5,a4
    2fa0:	00078067          	jr	a5
    2fa4:	ff018793          	addi	a5,gp,-16 # 6840 <seed5_volatile>
    2fa8:	0007a503          	lw	a0,0(a5)
    2fac:	00008067          	ret
    2fb0:	fe818793          	addi	a5,gp,-24 # 6838 <seed1_volatile>
    2fb4:	0007a503          	lw	a0,0(a5)
    2fb8:	00008067          	ret
    2fbc:	fec18793          	addi	a5,gp,-20 # 683c <seed2_volatile>
    2fc0:	0007a503          	lw	a0,0(a5)
    2fc4:	00008067          	ret
    2fc8:	00003797          	auipc	a5,0x3
    2fcc:	08078793          	addi	a5,a5,128 # 6048 <seed3_volatile>
    2fd0:	0007a503          	lw	a0,0(a5)
    2fd4:	00008067          	ret
    2fd8:	00003797          	auipc	a5,0x3
    2fdc:	07478793          	addi	a5,a5,116 # 604c <seed4_volatile>
    2fe0:	0007a503          	lw	a0,0(a5)
    2fe4:	00008067          	ret
    2fe8:	00000513          	li	a0,0
    2fec:	00008067          	ret

00002ff0 <crcu16>:
    2ff0:	ffffa837          	lui	a6,0xffffa
    2ff4:	0ff57693          	andi	a3,a0,255
    2ff8:	00800793          	li	a5,8
    2ffc:	00180813          	addi	a6,a6,1 # ffffa001 <__stack_top+0xfffea001>
    3000:	00d5c733          	xor	a4,a1,a3
    3004:	fff78793          	addi	a5,a5,-1
    3008:	0015d593          	srli	a1,a1,0x1
    300c:	00177713          	andi	a4,a4,1
    3010:	0ff7f793          	andi	a5,a5,255
    3014:	0105c633          	xor	a2,a1,a6
    3018:	0016d693          	srli	a3,a3,0x1
    301c:	00070663          	beqz	a4,3028 <crcu16+0x38>
    3020:	01061593          	slli	a1,a2,0x10
    3024:	0105d593          	srli	a1,a1,0x10
    3028:	fc079ce3          	bnez	a5,3000 <crcu16+0x10>
    302c:	ffffa637          	lui	a2,0xffffa
    3030:	00855513          	srli	a0,a0,0x8
    3034:	00800793          	li	a5,8
    3038:	00160613          	addi	a2,a2,1 # ffffa001 <__stack_top+0xfffea001>
    303c:	00a5c733          	xor	a4,a1,a0
    3040:	fff78793          	addi	a5,a5,-1
    3044:	0015d593          	srli	a1,a1,0x1
    3048:	00177713          	andi	a4,a4,1
    304c:	0ff7f793          	andi	a5,a5,255
    3050:	00c5c6b3          	xor	a3,a1,a2
    3054:	00155513          	srli	a0,a0,0x1
    3058:	00070663          	beqz	a4,3064 <crcu16+0x74>
    305c:	01069593          	slli	a1,a3,0x10
    3060:	0105d593          	srli	a1,a1,0x10
    3064:	fc079ce3          	bnez	a5,303c <crcu16+0x4c>
    3068:	00058513          	mv	a0,a1
    306c:	00008067          	ret

00003070 <crcu32>:
    3070:	ff010113          	addi	sp,sp,-16
    3074:	00812423          	sw	s0,8(sp)
    3078:	00050413          	mv	s0,a0
    307c:	01051513          	slli	a0,a0,0x10
    3080:	01055513          	srli	a0,a0,0x10
    3084:	00112623          	sw	ra,12(sp)
    3088:	f69ff0ef          	jal	ra,2ff0 <crcu16>
    308c:	00050593          	mv	a1,a0
    3090:	01045513          	srli	a0,s0,0x10
    3094:	00812403          	lw	s0,8(sp)
    3098:	00c12083          	lw	ra,12(sp)
    309c:	01010113          	addi	sp,sp,16
    30a0:	f51ff06f          	j	2ff0 <crcu16>

000030a4 <crc16>:
    30a4:	01051513          	slli	a0,a0,0x10
    30a8:	01055513          	srli	a0,a0,0x10
    30ac:	f45ff06f          	j	2ff0 <crcu16>

000030b0 <check_data_types>:
    30b0:	00000513          	li	a0,0
    30b4:	00008067          	ret

000030b8 <start_time>:
    30b8:	fffff7b7          	lui	a5,0xfffff
    30bc:	0907a783          	lw	a5,144(a5) # fffff090 <__stack_top+0xfffef090>
    30c0:	fef1aa23          	sw	a5,-12(gp) # 6844 <start_time_val>
    30c4:	00008067          	ret

000030c8 <stop_time>:
    30c8:	fffff7b7          	lui	a5,0xfffff
    30cc:	0907a783          	lw	a5,144(a5) # fffff090 <__stack_top+0xfffef090>
    30d0:	fef1ac23          	sw	a5,-8(gp) # 6848 <stop_time_val>
    30d4:	00008067          	ret

000030d8 <get_time>:
    30d8:	ff818793          	addi	a5,gp,-8 # 6848 <stop_time_val>
    30dc:	0007a503          	lw	a0,0(a5)
    30e0:	ff418793          	addi	a5,gp,-12 # 6844 <start_time_val>
    30e4:	0007a783          	lw	a5,0(a5)
    30e8:	40f50533          	sub	a0,a0,a5
    30ec:	00008067          	ret

000030f0 <time_in_secs>:
    30f0:	047877b7          	lui	a5,0x4787
    30f4:	8c078793          	addi	a5,a5,-1856 # 47868c0 <__stack_top+0x47768c0>
    30f8:	02f55533          	divu	a0,a0,a5
    30fc:	00008067          	ret

00003100 <portable_init>:
    3100:	fe010113          	addi	sp,sp,-32
    3104:	00812c23          	sw	s0,24(sp)
    3108:	00050413          	mv	s0,a0
    310c:	00003517          	auipc	a0,0x3
    3110:	aec50513          	addi	a0,a0,-1300 # 5bf8 <scipat+0xfc>
    3114:	00112e23          	sw	ra,28(sp)
    3118:	3e4000ef          	jal	ra,34fc <ee_printf>
    311c:	00003517          	auipc	a0,0x3
    3120:	b0450513          	addi	a0,a0,-1276 # 5c20 <scipat+0x124>
    3124:	3d8000ef          	jal	ra,34fc <ee_printf>
    3128:	00003517          	auipc	a0,0x3
    312c:	b1c50513          	addi	a0,a0,-1252 # 5c44 <scipat+0x148>
    3130:	3cc000ef          	jal	ra,34fc <ee_printf>
    3134:	00003517          	auipc	a0,0x3
    3138:	b2c50513          	addi	a0,a0,-1236 # 5c60 <scipat+0x164>
    313c:	3c0000ef          	jal	ra,34fc <ee_printf>
    3140:	047875b7          	lui	a1,0x4787
    3144:	8c058593          	addi	a1,a1,-1856 # 47868c0 <__stack_top+0x47768c0>
    3148:	00003517          	auipc	a0,0x3
    314c:	b4450513          	addi	a0,a0,-1212 # 5c8c <scipat+0x190>
    3150:	3ac000ef          	jal	ra,34fc <ee_printf>
    3154:	fffff7b7          	lui	a5,0xfffff
    3158:	0907a683          	lw	a3,144(a5) # fffff090 <__stack_top+0xfffef090>
    315c:	00012623          	sw	zero,12(sp)
    3160:	00c12703          	lw	a4,12(sp)
    3164:	3e700793          	li	a5,999
    3168:	00e7ee63          	bltu	a5,a4,3184 <portable_init+0x84>
    316c:	3e700713          	li	a4,999
    3170:	00c12783          	lw	a5,12(sp)
    3174:	00178793          	addi	a5,a5,1
    3178:	00f12623          	sw	a5,12(sp)
    317c:	00c12783          	lw	a5,12(sp)
    3180:	fef778e3          	bgeu	a4,a5,3170 <portable_init+0x70>
    3184:	fffff7b7          	lui	a5,0xfffff
    3188:	0907a603          	lw	a2,144(a5) # fffff090 <__stack_top+0xfffef090>
    318c:	00068593          	mv	a1,a3
    3190:	00003517          	auipc	a0,0x3
    3194:	b0c50513          	addi	a0,a0,-1268 # 5c9c <scipat+0x1a0>
    3198:	40d606b3          	sub	a3,a2,a3
    319c:	360000ef          	jal	ra,34fc <ee_printf>
    31a0:	00003517          	auipc	a0,0x3
    31a4:	b2450513          	addi	a0,a0,-1244 # 5cc4 <scipat+0x1c8>
    31a8:	354000ef          	jal	ra,34fc <ee_printf>
    31ac:	00100793          	li	a5,1
    31b0:	00f40023          	sb	a5,0(s0)
    31b4:	01c12083          	lw	ra,28(sp)
    31b8:	01812403          	lw	s0,24(sp)
    31bc:	02010113          	addi	sp,sp,32
    31c0:	00008067          	ret

000031c4 <portable_fini>:
    31c4:	ff010113          	addi	sp,sp,-16
    31c8:	00112623          	sw	ra,12(sp)
    31cc:	00050023          	sb	zero,0(a0)
    31d0:	00003517          	auipc	a0,0x3
    31d4:	a2850513          	addi	a0,a0,-1496 # 5bf8 <scipat+0xfc>
    31d8:	324000ef          	jal	ra,34fc <ee_printf>
    31dc:	00003517          	auipc	a0,0x3
    31e0:	9f850513          	addi	a0,a0,-1544 # 5bd4 <scipat+0xd8>
    31e4:	318000ef          	jal	ra,34fc <ee_printf>
    31e8:	00c12083          	lw	ra,12(sp)
    31ec:	00003517          	auipc	a0,0x3
    31f0:	ad850513          	addi	a0,a0,-1320 # 5cc4 <scipat+0x1c8>
    31f4:	01010113          	addi	sp,sp,16
    31f8:	3040006f          	j	34fc <ee_printf>

000031fc <number>:
    31fc:	fa010113          	addi	sp,sp,-96
    3200:	04812e23          	sw	s0,92(sp)
    3204:	04912c23          	sw	s1,88(sp)
    3208:	05212a23          	sw	s2,84(sp)
    320c:	05312823          	sw	s3,80(sp)
    3210:	0407f813          	andi	a6,a5,64
    3214:	00003f97          	auipc	t6,0x3
    3218:	d08f8f93          	addi	t6,t6,-760 # 5f1c <scipat+0x420>
    321c:	00081663          	bnez	a6,3228 <number+0x2c>
    3220:	00003f97          	auipc	t6,0x3
    3224:	cd4f8f93          	addi	t6,t6,-812 # 5ef4 <scipat+0x3f8>
    3228:	0107f413          	andi	s0,a5,16
    322c:	1a041e63          	bnez	s0,33e8 <number+0x1ec>
    3230:	0017f813          	andi	a6,a5,1
    3234:	0117f993          	andi	s3,a5,17
    3238:	03000393          	li	t2,48
    323c:	1a080a63          	beqz	a6,33f0 <number+0x1f4>
    3240:	0027f813          	andi	a6,a5,2
    3244:	0207f493          	andi	s1,a5,32
    3248:	1a080c63          	beqz	a6,3400 <number+0x204>
    324c:	1a05ce63          	bltz	a1,3408 <number+0x20c>
    3250:	0047f813          	andi	a6,a5,4
    3254:	20081063          	bnez	a6,3454 <number+0x258>
    3258:	0087f793          	andi	a5,a5,8
    325c:	00000913          	li	s2,0
    3260:	00078663          	beqz	a5,326c <number+0x70>
    3264:	fff68693          	addi	a3,a3,-1
    3268:	02000913          	li	s2,32
    326c:	00048c63          	beqz	s1,3284 <number+0x88>
    3270:	01000793          	li	a5,16
    3274:	20f60263          	beq	a2,a5,3478 <number+0x27c>
    3278:	ff860793          	addi	a5,a2,-8
    327c:	0017b793          	seqz	a5,a5
    3280:	40f686b3          	sub	a3,a3,a5
    3284:	18059a63          	bnez	a1,3418 <number+0x21c>
    3288:	03000793          	li	a5,48
    328c:	00f10623          	sb	a5,12(sp)
    3290:	00000313          	li	t1,0
    3294:	03000813          	li	a6,48
    3298:	00100293          	li	t0,1
    329c:	00100e13          	li	t3,1
    32a0:	00c10793          	addi	a5,sp,12
    32a4:	00028e93          	mv	t4,t0
    32a8:	00e2d463          	bge	t0,a4,32b0 <number+0xb4>
    32ac:	00070e93          	mv	t4,a4
    32b0:	41d686b3          	sub	a3,a3,t4
    32b4:	fff68893          	addi	a7,a3,-1
    32b8:	02099263          	bnez	s3,32dc <number+0xe0>
    32bc:	00d505b3          	add	a1,a0,a3
    32c0:	02000713          	li	a4,32
    32c4:	1cd05a63          	blez	a3,3498 <number+0x29c>
    32c8:	00150513          	addi	a0,a0,1
    32cc:	fee50fa3          	sb	a4,-1(a0)
    32d0:	feb51ce3          	bne	a0,a1,32c8 <number+0xcc>
    32d4:	ffe00893          	li	a7,-2
    32d8:	fff00693          	li	a3,-1
    32dc:	00090663          	beqz	s2,32e8 <number+0xec>
    32e0:	01250023          	sb	s2,0(a0)
    32e4:	00150513          	addi	a0,a0,1
    32e8:	00048a63          	beqz	s1,32fc <number+0x100>
    32ec:	00800713          	li	a4,8
    32f0:	18e60863          	beq	a2,a4,3480 <number+0x284>
    32f4:	01000713          	li	a4,16
    32f8:	16e60463          	beq	a2,a4,3460 <number+0x264>
    32fc:	04041463          	bnez	s0,3344 <number+0x148>
    3300:	00050713          	mv	a4,a0
    3304:	00100613          	li	a2,1
    3308:	1ad05063          	blez	a3,34a8 <number+0x2ac>
    330c:	00170713          	addi	a4,a4,1
    3310:	40e606b3          	sub	a3,a2,a4
    3314:	011686b3          	add	a3,a3,a7
    3318:	fe770fa3          	sb	t2,-1(a4)
    331c:	00d506b3          	add	a3,a0,a3
    3320:	fed046e3          	bgtz	a3,330c <number+0x110>
    3324:	fff8c713          	not	a4,a7
    3328:	41f75713          	srai	a4,a4,0x1f
    332c:	00e8f733          	and	a4,a7,a4
    3330:	fff88693          	addi	a3,a7,-1
    3334:	40e686b3          	sub	a3,a3,a4
    3338:	00170713          	addi	a4,a4,1
    333c:	00e50533          	add	a0,a0,a4
    3340:	fff68893          	addi	a7,a3,-1
    3344:	405e8733          	sub	a4,t4,t0
    3348:	00e50733          	add	a4,a0,a4
    334c:	03000613          	li	a2,48
    3350:	15d2d063          	bge	t0,t4,3490 <number+0x294>
    3354:	00150513          	addi	a0,a0,1
    3358:	fec50fa3          	sb	a2,-1(a0)
    335c:	fee51ce3          	bne	a0,a4,3354 <number+0x158>
    3360:	006785b3          	add	a1,a5,t1
    3364:	00070613          	mv	a2,a4
    3368:	00100513          	li	a0,1
    336c:	0080006f          	j	3374 <number+0x178>
    3370:	0005c803          	lbu	a6,0(a1)
    3374:	00160613          	addi	a2,a2,1
    3378:	40c507b3          	sub	a5,a0,a2
    337c:	006787b3          	add	a5,a5,t1
    3380:	ff060fa3          	sb	a6,-1(a2)
    3384:	00f707b3          	add	a5,a4,a5
    3388:	fff58593          	addi	a1,a1,-1
    338c:	fef042e3          	bgtz	a5,3370 <number+0x174>
    3390:	01c70533          	add	a0,a4,t3
    3394:	02d05e63          	blez	a3,33d0 <number+0x1d4>
    3398:	00050713          	mv	a4,a0
    339c:	02000613          	li	a2,32
    33a0:	00100693          	li	a3,1
    33a4:	00170713          	addi	a4,a4,1
    33a8:	40e687b3          	sub	a5,a3,a4
    33ac:	011787b3          	add	a5,a5,a7
    33b0:	fec70fa3          	sb	a2,-1(a4)
    33b4:	00f507b3          	add	a5,a0,a5
    33b8:	fef046e3          	bgtz	a5,33a4 <number+0x1a8>
    33bc:	fff8c793          	not	a5,a7
    33c0:	41f7d793          	srai	a5,a5,0x1f
    33c4:	00f8f8b3          	and	a7,a7,a5
    33c8:	00188893          	addi	a7,a7,1
    33cc:	01150533          	add	a0,a0,a7
    33d0:	05c12403          	lw	s0,92(sp)
    33d4:	05812483          	lw	s1,88(sp)
    33d8:	05412903          	lw	s2,84(sp)
    33dc:	05012983          	lw	s3,80(sp)
    33e0:	06010113          	addi	sp,sp,96
    33e4:	00008067          	ret
    33e8:	ffe7f793          	andi	a5,a5,-2
    33ec:	00040993          	mv	s3,s0
    33f0:	0027f813          	andi	a6,a5,2
    33f4:	02000393          	li	t2,32
    33f8:	0207f493          	andi	s1,a5,32
    33fc:	e40818e3          	bnez	a6,324c <number+0x50>
    3400:	00000913          	li	s2,0
    3404:	e69ff06f          	j	326c <number+0x70>
    3408:	40b005b3          	neg	a1,a1
    340c:	fff68693          	addi	a3,a3,-1
    3410:	02d00913          	li	s2,45
    3414:	e4049ee3          	bnez	s1,3270 <number+0x74>
    3418:	00000313          	li	t1,0
    341c:	00c10793          	addi	a5,sp,12
    3420:	0080006f          	j	3428 <number+0x22c>
    3424:	000e0313          	mv	t1,t3
    3428:	02c5f833          	remu	a6,a1,a2
    342c:	00130e13          	addi	t3,t1,1
    3430:	01c78f33          	add	t5,a5,t3
    3434:	00058e93          	mv	t4,a1
    3438:	000e0293          	mv	t0,t3
    343c:	010f8833          	add	a6,t6,a6
    3440:	00084803          	lbu	a6,0(a6)
    3444:	02c5d5b3          	divu	a1,a1,a2
    3448:	ff0f0fa3          	sb	a6,-1(t5)
    344c:	fccefce3          	bgeu	t4,a2,3424 <number+0x228>
    3450:	e55ff06f          	j	32a4 <number+0xa8>
    3454:	fff68693          	addi	a3,a3,-1
    3458:	02b00913          	li	s2,43
    345c:	e11ff06f          	j	326c <number+0x70>
    3460:	03000713          	li	a4,48
    3464:	00e50023          	sb	a4,0(a0)
    3468:	07800713          	li	a4,120
    346c:	00e500a3          	sb	a4,1(a0)
    3470:	00250513          	addi	a0,a0,2
    3474:	e89ff06f          	j	32fc <number+0x100>
    3478:	ffe68693          	addi	a3,a3,-2
    347c:	e09ff06f          	j	3284 <number+0x88>
    3480:	03000713          	li	a4,48
    3484:	00e50023          	sb	a4,0(a0)
    3488:	00150513          	addi	a0,a0,1
    348c:	e71ff06f          	j	32fc <number+0x100>
    3490:	00050713          	mv	a4,a0
    3494:	ecdff06f          	j	3360 <number+0x164>
    3498:	ffe68713          	addi	a4,a3,-2
    349c:	00088693          	mv	a3,a7
    34a0:	00070893          	mv	a7,a4
    34a4:	e39ff06f          	j	32dc <number+0xe0>
    34a8:	00088693          	mv	a3,a7
    34ac:	fff88893          	addi	a7,a7,-1
    34b0:	e95ff06f          	j	3344 <number+0x148>

000034b4 <uart_send_char>:
    34b4:	ff010113          	addi	sp,sp,-16
    34b8:	00812423          	sw	s0,8(sp)
    34bc:	00112623          	sw	ra,12(sp)
    34c0:	00a00793          	li	a5,10
    34c4:	00050413          	mv	s0,a0
    34c8:	02f50463          	beq	a0,a5,34f0 <uart_send_char+0x3c>
    34cc:	fffff737          	lui	a4,0xfffff
    34d0:	08472783          	lw	a5,132(a4) # fffff084 <__stack_top+0xfffef084>
    34d4:	0017f793          	andi	a5,a5,1
    34d8:	fe079ce3          	bnez	a5,34d0 <uart_send_char+0x1c>
    34dc:	08872023          	sw	s0,128(a4)
    34e0:	00c12083          	lw	ra,12(sp)
    34e4:	00812403          	lw	s0,8(sp)
    34e8:	01010113          	addi	sp,sp,16
    34ec:	00008067          	ret
    34f0:	00d00513          	li	a0,13
    34f4:	fc1ff0ef          	jal	ra,34b4 <uart_send_char>
    34f8:	fd5ff06f          	j	34cc <uart_send_char+0x18>

000034fc <ee_printf>:
    34fc:	b9010113          	addi	sp,sp,-1136
    3500:	43312e23          	sw	s3,1084(sp)
    3504:	44112623          	sw	ra,1100(sp)
    3508:	44812423          	sw	s0,1096(sp)
    350c:	44912223          	sw	s1,1092(sp)
    3510:	45212023          	sw	s2,1088(sp)
    3514:	43412c23          	sw	s4,1080(sp)
    3518:	43512a23          	sw	s5,1076(sp)
    351c:	43612823          	sw	s6,1072(sp)
    3520:	43712623          	sw	s7,1068(sp)
    3524:	43812423          	sw	s8,1064(sp)
    3528:	43912223          	sw	s9,1060(sp)
    352c:	43a12023          	sw	s10,1056(sp)
    3530:	44b12a23          	sw	a1,1108(sp)
    3534:	44c12c23          	sw	a2,1112(sp)
    3538:	44d12e23          	sw	a3,1116(sp)
    353c:	46e12023          	sw	a4,1120(sp)
    3540:	46f12223          	sw	a5,1124(sp)
    3544:	47012423          	sw	a6,1128(sp)
    3548:	47112623          	sw	a7,1132(sp)
    354c:	00054783          	lbu	a5,0(a0)
    3550:	45410993          	addi	s3,sp,1108
    3554:	01312223          	sw	s3,4(sp)
    3558:	74078e63          	beqz	a5,3cb4 <ee_printf+0x7b8>
    355c:	02010913          	addi	s2,sp,32
    3560:	00050313          	mv	t1,a0
    3564:	00002497          	auipc	s1,0x2
    3568:	78448493          	addi	s1,s1,1924 # 5ce8 <scipat+0x1ec>
    356c:	00090513          	mv	a0,s2
    3570:	02e00a13          	li	s4,46
    3574:	00002b17          	auipc	s6,0x2
    3578:	7b8b0b13          	addi	s6,s6,1976 # 5d2c <scipat+0x230>
    357c:	00003417          	auipc	s0,0x3
    3580:	97840413          	addi	s0,s0,-1672 # 5ef4 <scipat+0x3f8>
    3584:	00003a97          	auipc	s5,0x3
    3588:	888a8a93          	addi	s5,s5,-1912 # 5e0c <scipat+0x310>
    358c:	02500713          	li	a4,37
    3590:	08e78663          	beq	a5,a4,361c <ee_printf+0x120>
    3594:	00f50023          	sb	a5,0(a0)
    3598:	00134783          	lbu	a5,1(t1)
    359c:	00150513          	addi	a0,a0,1
    35a0:	00130313          	addi	t1,t1,1
    35a4:	fe0794e3          	bnez	a5,358c <ee_printf+0x90>
    35a8:	00050023          	sb	zero,0(a0)
    35ac:	412504b3          	sub	s1,a0,s2
    35b0:	02905863          	blez	s1,35e0 <ee_printf+0xe4>
    35b4:	00990ab3          	add	s5,s2,s1
    35b8:	00a00a13          	li	s4,10
    35bc:	fffff437          	lui	s0,0xfffff
    35c0:	00094983          	lbu	s3,0(s2)
    35c4:	13498463          	beq	s3,s4,36ec <ee_printf+0x1f0>
    35c8:	08442783          	lw	a5,132(s0) # fffff084 <__stack_top+0xfffef084>
    35cc:	0017f793          	andi	a5,a5,1
    35d0:	fe079ce3          	bnez	a5,35c8 <ee_printf+0xcc>
    35d4:	09342023          	sw	s3,128(s0)
    35d8:	00190913          	addi	s2,s2,1
    35dc:	ff2a92e3          	bne	s5,s2,35c0 <ee_printf+0xc4>
    35e0:	44c12083          	lw	ra,1100(sp)
    35e4:	44812403          	lw	s0,1096(sp)
    35e8:	00048513          	mv	a0,s1
    35ec:	44012903          	lw	s2,1088(sp)
    35f0:	44412483          	lw	s1,1092(sp)
    35f4:	43c12983          	lw	s3,1084(sp)
    35f8:	43812a03          	lw	s4,1080(sp)
    35fc:	43412a83          	lw	s5,1076(sp)
    3600:	43012b03          	lw	s6,1072(sp)
    3604:	42c12b83          	lw	s7,1068(sp)
    3608:	42812c03          	lw	s8,1064(sp)
    360c:	42412c83          	lw	s9,1060(sp)
    3610:	42012d03          	lw	s10,1056(sp)
    3614:	47010113          	addi	sp,sp,1136
    3618:	00008067          	ret
    361c:	00134583          	lbu	a1,1(t1)
    3620:	01000693          	li	a3,16
    3624:	00000793          	li	a5,0
    3628:	fe058713          	addi	a4,a1,-32
    362c:	0ff77713          	andi	a4,a4,255
    3630:	00130613          	addi	a2,t1,1
    3634:	02e6ea63          	bltu	a3,a4,3668 <ee_printf+0x16c>
    3638:	00271713          	slli	a4,a4,0x2
    363c:	00970733          	add	a4,a4,s1
    3640:	00072703          	lw	a4,0(a4)
    3644:	00970733          	add	a4,a4,s1
    3648:	00070067          	jr	a4
    364c:	0017e793          	ori	a5,a5,1
    3650:	00060313          	mv	t1,a2
    3654:	00134583          	lbu	a1,1(t1)
    3658:	00130613          	addi	a2,t1,1
    365c:	fe058713          	addi	a4,a1,-32
    3660:	0ff77713          	andi	a4,a4,255
    3664:	fce6fae3          	bgeu	a3,a4,3638 <ee_printf+0x13c>
    3668:	fd058713          	addi	a4,a1,-48
    366c:	0ff77713          	andi	a4,a4,255
    3670:	00900693          	li	a3,9
    3674:	0ce6fe63          	bgeu	a3,a4,3750 <ee_printf+0x254>
    3678:	02a00713          	li	a4,42
    367c:	fff00693          	li	a3,-1
    3680:	10e58263          	beq	a1,a4,3784 <ee_printf+0x288>
    3684:	fff00713          	li	a4,-1
    3688:	09458e63          	beq	a1,s4,3724 <ee_printf+0x228>
    368c:	0df5f813          	andi	a6,a1,223
    3690:	04c00893          	li	a7,76
    3694:	07180263          	beq	a6,a7,36f8 <ee_printf+0x1fc>
    3698:	fbf58813          	addi	a6,a1,-65
    369c:	0ff87813          	andi	a6,a6,255
    36a0:	03700893          	li	a7,55
    36a4:	2508ec63          	bltu	a7,a6,38fc <ee_printf+0x400>
    36a8:	00281813          	slli	a6,a6,0x2
    36ac:	01680833          	add	a6,a6,s6
    36b0:	00082803          	lw	a6,0(a6)
    36b4:	01680833          	add	a6,a6,s6
    36b8:	00080067          	jr	a6
    36bc:	0107e793          	ori	a5,a5,16
    36c0:	00060313          	mv	t1,a2
    36c4:	f91ff06f          	j	3654 <ee_printf+0x158>
    36c8:	0047e793          	ori	a5,a5,4
    36cc:	00060313          	mv	t1,a2
    36d0:	f85ff06f          	j	3654 <ee_printf+0x158>
    36d4:	0207e793          	ori	a5,a5,32
    36d8:	00060313          	mv	t1,a2
    36dc:	f79ff06f          	j	3654 <ee_printf+0x158>
    36e0:	0087e793          	ori	a5,a5,8
    36e4:	00060313          	mv	t1,a2
    36e8:	f6dff06f          	j	3654 <ee_printf+0x158>
    36ec:	00d00513          	li	a0,13
    36f0:	dc5ff0ef          	jal	ra,34b4 <uart_send_char>
    36f4:	ed5ff06f          	j	35c8 <ee_printf+0xcc>
    36f8:	00164883          	lbu	a7,1(a2)
    36fc:	03700313          	li	t1,55
    3700:	00160b93          	addi	s7,a2,1
    3704:	fbf88813          	addi	a6,a7,-65
    3708:	0ff87813          	andi	a6,a6,255
    370c:	1f036c63          	bltu	t1,a6,3904 <ee_printf+0x408>
    3710:	00281813          	slli	a6,a6,0x2
    3714:	01580833          	add	a6,a6,s5
    3718:	00082803          	lw	a6,0(a6)
    371c:	01580833          	add	a6,a6,s5
    3720:	00080067          	jr	a6
    3724:	00164583          	lbu	a1,1(a2)
    3728:	00900893          	li	a7,9
    372c:	00160813          	addi	a6,a2,1
    3730:	fd058713          	addi	a4,a1,-48
    3734:	0ff77713          	andi	a4,a4,255
    3738:	1ee8f663          	bgeu	a7,a4,3924 <ee_printf+0x428>
    373c:	02a00713          	li	a4,42
    3740:	20e58c63          	beq	a1,a4,3958 <ee_printf+0x45c>
    3744:	00080613          	mv	a2,a6
    3748:	00000713          	li	a4,0
    374c:	f41ff06f          	j	368c <ee_printf+0x190>
    3750:	00000693          	li	a3,0
    3754:	00900813          	li	a6,9
    3758:	00269713          	slli	a4,a3,0x2
    375c:	00d706b3          	add	a3,a4,a3
    3760:	00160613          	addi	a2,a2,1
    3764:	00169693          	slli	a3,a3,0x1
    3768:	00b686b3          	add	a3,a3,a1
    376c:	00064583          	lbu	a1,0(a2)
    3770:	fd068693          	addi	a3,a3,-48
    3774:	fd058713          	addi	a4,a1,-48
    3778:	0ff77713          	andi	a4,a4,255
    377c:	fce87ee3          	bgeu	a6,a4,3758 <ee_printf+0x25c>
    3780:	f05ff06f          	j	3684 <ee_printf+0x188>
    3784:	0009a683          	lw	a3,0(s3)
    3788:	00230613          	addi	a2,t1,2
    378c:	00234583          	lbu	a1,2(t1)
    3790:	00498993          	addi	s3,s3,4
    3794:	ee06d8e3          	bgez	a3,3684 <ee_printf+0x188>
    3798:	40d006b3          	neg	a3,a3
    379c:	0107e793          	ori	a5,a5,16
    37a0:	ee5ff06f          	j	3684 <ee_printf+0x188>
    37a4:	00060b93          	mv	s7,a2
    37a8:	0407e793          	ori	a5,a5,64
    37ac:	01000613          	li	a2,16
    37b0:	00498813          	addi	a6,s3,4
    37b4:	0009a583          	lw	a1,0(s3)
    37b8:	00080993          	mv	s3,a6
    37bc:	a41ff0ef          	jal	ra,31fc <number>
    37c0:	001bc783          	lbu	a5,1(s7)
    37c4:	001b8313          	addi	t1,s7,1
    37c8:	dc0792e3          	bnez	a5,358c <ee_printf+0x90>
    37cc:	dddff06f          	j	35a8 <ee_printf+0xac>
    37d0:	00060b93          	mv	s7,a2
    37d4:	00a00613          	li	a2,10
    37d8:	fd9ff06f          	j	37b0 <ee_printf+0x2b4>
    37dc:	00060b93          	mv	s7,a2
    37e0:	0009a603          	lw	a2,0(s3)
    37e4:	00498993          	addi	s3,s3,4
    37e8:	48060863          	beqz	a2,3c78 <ee_printf+0x77c>
    37ec:	00064583          	lbu	a1,0(a2)
    37f0:	50058063          	beqz	a1,3cf0 <ee_printf+0x7f4>
    37f4:	4e070e63          	beqz	a4,3cf0 <ee_printf+0x7f4>
    37f8:	00060593          	mv	a1,a2
    37fc:	00c0006f          	j	3808 <ee_printf+0x30c>
    3800:	40e58833          	sub	a6,a1,a4
    3804:	00c80863          	beq	a6,a2,3814 <ee_printf+0x318>
    3808:	00158593          	addi	a1,a1,1
    380c:	0005c803          	lbu	a6,0(a1)
    3810:	fe0818e3          	bnez	a6,3800 <ee_printf+0x304>
    3814:	0107f713          	andi	a4,a5,16
    3818:	40c587b3          	sub	a5,a1,a2
    381c:	4a070463          	beqz	a4,3cc4 <ee_printf+0x7c8>
    3820:	54f05e63          	blez	a5,3d7c <ee_printf+0x880>
    3824:	00f60833          	add	a6,a2,a5
    3828:	00050713          	mv	a4,a0
    382c:	00160613          	addi	a2,a2,1
    3830:	fff64583          	lbu	a1,-1(a2)
    3834:	00170713          	addi	a4,a4,1
    3838:	feb70fa3          	sb	a1,-1(a4)
    383c:	ff0618e3          	bne	a2,a6,382c <ee_printf+0x330>
    3840:	00f50733          	add	a4,a0,a5
    3844:	40f68533          	sub	a0,a3,a5
    3848:	001b8313          	addi	t1,s7,1
    384c:	00a70533          	add	a0,a4,a0
    3850:	02000613          	li	a2,32
    3854:	4cd7de63          	bge	a5,a3,3d30 <ee_printf+0x834>
    3858:	00170713          	addi	a4,a4,1
    385c:	fec70fa3          	sb	a2,-1(a4)
    3860:	fea71ce3          	bne	a4,a0,3858 <ee_printf+0x35c>
    3864:	001bc783          	lbu	a5,1(s7)
    3868:	d20792e3          	bnez	a5,358c <ee_printf+0x90>
    386c:	d3dff06f          	j	35a8 <ee_printf+0xac>
    3870:	00060b93          	mv	s7,a2
    3874:	fff00613          	li	a2,-1
    3878:	3cc68a63          	beq	a3,a2,3c4c <ee_printf+0x750>
    387c:	0009a583          	lw	a1,0(s3)
    3880:	01000613          	li	a2,16
    3884:	00498993          	addi	s3,s3,4
    3888:	975ff0ef          	jal	ra,31fc <number>
    388c:	001bc783          	lbu	a5,1(s7)
    3890:	001b8313          	addi	t1,s7,1
    3894:	ce079ce3          	bnez	a5,358c <ee_printf+0x90>
    3898:	d11ff06f          	j	35a8 <ee_printf+0xac>
    389c:	00060b93          	mv	s7,a2
    38a0:	00800613          	li	a2,8
    38a4:	f0dff06f          	j	37b0 <ee_printf+0x2b4>
    38a8:	00060b93          	mv	s7,a2
    38ac:	0107f793          	andi	a5,a5,16
    38b0:	fff68693          	addi	a3,a3,-1
    38b4:	3a078263          	beqz	a5,3c58 <ee_printf+0x75c>
    38b8:	0009a703          	lw	a4,0(s3)
    38bc:	00150613          	addi	a2,a0,1
    38c0:	00168793          	addi	a5,a3,1
    38c4:	00e50023          	sb	a4,0(a0)
    38c8:	00498993          	addi	s3,s3,4
    38cc:	00f50533          	add	a0,a0,a5
    38d0:	001b8313          	addi	t1,s7,1
    38d4:	00060793          	mv	a5,a2
    38d8:	02000713          	li	a4,32
    38dc:	42d05e63          	blez	a3,3d18 <ee_printf+0x81c>
    38e0:	00178793          	addi	a5,a5,1
    38e4:	fee78fa3          	sb	a4,-1(a5)
    38e8:	fea79ce3          	bne	a5,a0,38e0 <ee_printf+0x3e4>
    38ec:	001bc783          	lbu	a5,1(s7)
    38f0:	00d60533          	add	a0,a2,a3
    38f4:	c8079ce3          	bnez	a5,358c <ee_printf+0x90>
    38f8:	cb1ff06f          	j	35a8 <ee_printf+0xac>
    38fc:	00058893          	mv	a7,a1
    3900:	00060b93          	mv	s7,a2
    3904:	02500713          	li	a4,37
    3908:	00150793          	addi	a5,a0,1
    390c:	30e88e63          	beq	a7,a4,3c28 <ee_printf+0x72c>
    3910:	00e50023          	sb	a4,0(a0)
    3914:	000bc703          	lbu	a4,0(s7)
    3918:	40071863          	bnez	a4,3d28 <ee_printf+0x82c>
    391c:	00078513          	mv	a0,a5
    3920:	c89ff06f          	j	35a8 <ee_printf+0xac>
    3924:	00000713          	li	a4,0
    3928:	00271613          	slli	a2,a4,0x2
    392c:	00e60733          	add	a4,a2,a4
    3930:	00180813          	addi	a6,a6,1
    3934:	00171713          	slli	a4,a4,0x1
    3938:	00b70733          	add	a4,a4,a1
    393c:	00084583          	lbu	a1,0(a6)
    3940:	fd070713          	addi	a4,a4,-48
    3944:	fd058613          	addi	a2,a1,-48
    3948:	0ff67613          	andi	a2,a2,255
    394c:	fcc8fee3          	bgeu	a7,a2,3928 <ee_printf+0x42c>
    3950:	00080613          	mv	a2,a6
    3954:	d39ff06f          	j	368c <ee_printf+0x190>
    3958:	0009a703          	lw	a4,0(s3)
    395c:	00264583          	lbu	a1,2(a2)
    3960:	00498993          	addi	s3,s3,4
    3964:	fff74813          	not	a6,a4
    3968:	41f85813          	srai	a6,a6,0x1f
    396c:	01077733          	and	a4,a4,a6
    3970:	00260613          	addi	a2,a2,2
    3974:	d19ff06f          	j	368c <ee_printf+0x190>
    3978:	06c00813          	li	a6,108
    397c:	0009a703          	lw	a4,0(s3)
    3980:	0407e793          	ori	a5,a5,64
    3984:	00498993          	addi	s3,s3,4
    3988:	00002e97          	auipc	t4,0x2
    398c:	594e8e93          	addi	t4,t4,1428 # 5f1c <scipat+0x420>
    3990:	33059663          	bne	a1,a6,3cbc <ee_printf+0x7c0>
    3994:	00810313          	addi	t1,sp,8
    3998:	01a10e13          	addi	t3,sp,26
    399c:	00030813          	mv	a6,t1
    39a0:	03a00f13          	li	t5,58
    39a4:	0080006f          	j	39ac <ee_printf+0x4b0>
    39a8:	ffe80fa3          	sb	t5,-1(a6)
    39ac:	00074583          	lbu	a1,0(a4)
    39b0:	00380813          	addi	a6,a6,3
    39b4:	00170713          	addi	a4,a4,1
    39b8:	0045d893          	srli	a7,a1,0x4
    39bc:	00f5f593          	andi	a1,a1,15
    39c0:	011e88b3          	add	a7,t4,a7
    39c4:	00be85b3          	add	a1,t4,a1
    39c8:	0008c883          	lbu	a7,0(a7)
    39cc:	0005c583          	lbu	a1,0(a1)
    39d0:	ff180ea3          	sb	a7,-3(a6)
    39d4:	feb80f23          	sb	a1,-2(a6)
    39d8:	fd0e18e3          	bne	t3,a6,39a8 <ee_printf+0x4ac>
    39dc:	0107f793          	andi	a5,a5,16
    39e0:	fff68893          	addi	a7,a3,-1
    39e4:	02079663          	bnez	a5,3a10 <ee_printf+0x514>
    39e8:	fef68793          	addi	a5,a3,-17
    39ec:	01100593          	li	a1,17
    39f0:	00f507b3          	add	a5,a0,a5
    39f4:	02000713          	li	a4,32
    39f8:	36d5da63          	bge	a1,a3,3d6c <ee_printf+0x870>
    39fc:	00150513          	addi	a0,a0,1
    3a00:	fee50fa3          	sb	a4,-1(a0)
    3a04:	fef51ce3          	bne	a0,a5,39fc <ee_printf+0x500>
    3a08:	00f00893          	li	a7,15
    3a0c:	01000693          	li	a3,16
    3a10:	00050813          	mv	a6,a0
    3a14:	01130593          	addi	a1,t1,17
    3a18:	00050793          	mv	a5,a0
    3a1c:	00034703          	lbu	a4,0(t1)
    3a20:	00178793          	addi	a5,a5,1
    3a24:	00130313          	addi	t1,t1,1
    3a28:	fee78fa3          	sb	a4,-1(a5)
    3a2c:	feb318e3          	bne	t1,a1,3a1c <ee_printf+0x520>
    3a30:	01100793          	li	a5,17
    3a34:	01150513          	addi	a0,a0,17
    3a38:	02d7d463          	bge	a5,a3,3a60 <ee_printf+0x564>
    3a3c:	02000593          	li	a1,32
    3a40:	01200693          	li	a3,18
    3a44:	01100713          	li	a4,17
    3a48:	00150513          	addi	a0,a0,1
    3a4c:	40a687b3          	sub	a5,a3,a0
    3a50:	010787b3          	add	a5,a5,a6
    3a54:	feb50fa3          	sb	a1,-1(a0)
    3a58:	011787b3          	add	a5,a5,a7
    3a5c:	fef746e3          	blt	a4,a5,3a48 <ee_printf+0x54c>
    3a60:	00264783          	lbu	a5,2(a2)
    3a64:	00260313          	addi	t1,a2,2
    3a68:	b20792e3          	bnez	a5,358c <ee_printf+0x90>
    3a6c:	b3dff06f          	j	35a8 <ee_printf+0xac>
    3a70:	06c00813          	li	a6,108
    3a74:	0009a703          	lw	a4,0(s3)
    3a78:	00498993          	addi	s3,s3,4
    3a7c:	25059063          	bne	a1,a6,3cbc <ee_printf+0x7c0>
    3a80:	0407f593          	andi	a1,a5,64
    3a84:	00040e93          	mv	t4,s0
    3a88:	f00586e3          	beqz	a1,3994 <ee_printf+0x498>
    3a8c:	00002e97          	auipc	t4,0x2
    3a90:	490e8e93          	addi	t4,t4,1168 # 5f1c <scipat+0x420>
    3a94:	f01ff06f          	j	3994 <ee_printf+0x498>
    3a98:	06c00893          	li	a7,108
    3a9c:	0027e793          	ori	a5,a5,2
    3aa0:	00498813          	addi	a6,s3,4
    3aa4:	00a00613          	li	a2,10
    3aa8:	d11586e3          	beq	a1,a7,37b4 <ee_printf+0x2b8>
    3aac:	16c0006f          	j	3c18 <ee_printf+0x71c>
    3ab0:	00060b93          	mv	s7,a2
    3ab4:	01000613          	li	a2,16
    3ab8:	cf9ff06f          	j	37b0 <ee_printf+0x2b4>
    3abc:	0009a703          	lw	a4,0(s3)
    3ac0:	00498993          	addi	s3,s3,4
    3ac4:	00074583          	lbu	a1,0(a4)
    3ac8:	00000893          	li	a7,0
    3acc:	00470313          	addi	t1,a4,4
    3ad0:	06300f13          	li	t5,99
    3ad4:	00900293          	li	t0,9
    3ad8:	00a00e13          	li	t3,10
    3adc:	06400f93          	li	t6,100
    3ae0:	03000e93          	li	t4,48
    3ae4:	00188813          	addi	a6,a7,1
    3ae8:	02059a63          	bnez	a1,3b1c <ee_printf+0x620>
    3aec:	42010593          	addi	a1,sp,1056
    3af0:	011588b3          	add	a7,a1,a7
    3af4:	bfd88423          	sb	t4,-1048(a7)
    3af8:	00170713          	addi	a4,a4,1
    3afc:	06670e63          	beq	a4,t1,3b78 <ee_printf+0x67c>
    3b00:	42010593          	addi	a1,sp,1056
    3b04:	010585b3          	add	a1,a1,a6
    3b08:	bf458423          	sb	s4,-1048(a1)
    3b0c:	00074583          	lbu	a1,0(a4)
    3b10:	00180893          	addi	a7,a6,1
    3b14:	00188813          	addi	a6,a7,1
    3b18:	fc058ae3          	beqz	a1,3aec <ee_printf+0x5f0>
    3b1c:	16bf5463          	bge	t5,a1,3c84 <ee_printf+0x788>
    3b20:	03f5ec33          	rem	s8,a1,t6
    3b24:	42010393          	addi	t2,sp,1056
    3b28:	01138d33          	add	s10,t2,a7
    3b2c:	01038cb3          	add	s9,t2,a6
    3b30:	00288b93          	addi	s7,a7,2
    3b34:	00388813          	addi	a6,a7,3
    3b38:	03f5c5b3          	div	a1,a1,t6
    3b3c:	03cc48b3          	div	a7,s8,t3
    3b40:	00b403b3          	add	t2,s0,a1
    3b44:	0003c583          	lbu	a1,0(t2)
    3b48:	bebd0423          	sb	a1,-1048(s10)
    3b4c:	03cc65b3          	rem	a1,s8,t3
    3b50:	011408b3          	add	a7,s0,a7
    3b54:	0008c883          	lbu	a7,0(a7)
    3b58:	bf1c8423          	sb	a7,-1048(s9)
    3b5c:	00b405b3          	add	a1,s0,a1
    3b60:	0005c883          	lbu	a7,0(a1)
    3b64:	42010593          	addi	a1,sp,1056
    3b68:	017585b3          	add	a1,a1,s7
    3b6c:	bf158423          	sb	a7,-1048(a1)
    3b70:	00170713          	addi	a4,a4,1
    3b74:	f86716e3          	bne	a4,t1,3b00 <ee_printf+0x604>
    3b78:	0107f793          	andi	a5,a5,16
    3b7c:	fff68893          	addi	a7,a3,-1
    3b80:	02079663          	bnez	a5,3bac <ee_printf+0x6b0>
    3b84:	410687b3          	sub	a5,a3,a6
    3b88:	00f507b3          	add	a5,a0,a5
    3b8c:	02000713          	li	a4,32
    3b90:	1ad85863          	bge	a6,a3,3d40 <ee_printf+0x844>
    3b94:	00150513          	addi	a0,a0,1
    3b98:	fee50fa3          	sb	a4,-1(a0)
    3b9c:	fef51ce3          	bne	a0,a5,3b94 <ee_printf+0x698>
    3ba0:	40d806b3          	sub	a3,a6,a3
    3ba4:	011686b3          	add	a3,a3,a7
    3ba8:	fff68893          	addi	a7,a3,-1
    3bac:	00810793          	addi	a5,sp,8
    3bb0:	01050733          	add	a4,a0,a6
    3bb4:	0007c583          	lbu	a1,0(a5)
    3bb8:	00150513          	addi	a0,a0,1
    3bbc:	00178793          	addi	a5,a5,1
    3bc0:	feb50fa3          	sb	a1,-1(a0)
    3bc4:	fee518e3          	bne	a0,a4,3bb4 <ee_printf+0x6b8>
    3bc8:	02d85263          	bge	a6,a3,3bec <ee_printf+0x6f0>
    3bcc:	02000593          	li	a1,32
    3bd0:	00100693          	li	a3,1
    3bd4:	00150513          	addi	a0,a0,1
    3bd8:	40a687b3          	sub	a5,a3,a0
    3bdc:	011787b3          	add	a5,a5,a7
    3be0:	feb50fa3          	sb	a1,-1(a0)
    3be4:	00f707b3          	add	a5,a4,a5
    3be8:	fef846e3          	blt	a6,a5,3bd4 <ee_printf+0x6d8>
    3bec:	00164783          	lbu	a5,1(a2)
    3bf0:	00160313          	addi	t1,a2,1
    3bf4:	98079ce3          	bnez	a5,358c <ee_printf+0x90>
    3bf8:	9b1ff06f          	j	35a8 <ee_printf+0xac>
    3bfc:	0009a703          	lw	a4,0(s3)
    3c00:	0407e793          	ori	a5,a5,64
    3c04:	00498993          	addi	s3,s3,4
    3c08:	ebdff06f          	j	3ac4 <ee_printf+0x5c8>
    3c0c:	0027e793          	ori	a5,a5,2
    3c10:	00498813          	addi	a6,s3,4
    3c14:	00060b93          	mv	s7,a2
    3c18:	0009a583          	lw	a1,0(s3)
    3c1c:	00a00613          	li	a2,10
    3c20:	00080993          	mv	s3,a6
    3c24:	b99ff06f          	j	37bc <ee_printf+0x2c0>
    3c28:	000bc703          	lbu	a4,0(s7)
    3c2c:	00078693          	mv	a3,a5
    3c30:	00050793          	mv	a5,a0
    3c34:	00068513          	mv	a0,a3
    3c38:	00e78023          	sb	a4,0(a5)
    3c3c:	001bc783          	lbu	a5,1(s7)
    3c40:	001b8313          	addi	t1,s7,1
    3c44:	940794e3          	bnez	a5,358c <ee_printf+0x90>
    3c48:	961ff06f          	j	35a8 <ee_printf+0xac>
    3c4c:	0017e793          	ori	a5,a5,1
    3c50:	00800693          	li	a3,8
    3c54:	c29ff06f          	j	387c <ee_printf+0x380>
    3c58:	00d50733          	add	a4,a0,a3
    3c5c:	02000793          	li	a5,32
    3c60:	0ad05263          	blez	a3,3d04 <ee_printf+0x808>
    3c64:	00150513          	addi	a0,a0,1
    3c68:	fef50fa3          	sb	a5,-1(a0)
    3c6c:	fee51ce3          	bne	a0,a4,3c64 <ee_printf+0x768>
    3c70:	fff00693          	li	a3,-1
    3c74:	c45ff06f          	j	38b8 <ee_printf+0x3bc>
    3c78:	00002617          	auipc	a2,0x2
    3c7c:	27460613          	addi	a2,a2,628 # 5eec <scipat+0x3f0>
    3c80:	b75ff06f          	j	37f4 <ee_printf+0x2f8>
    3c84:	00088b93          	mv	s7,a7
    3c88:	ecb2dae3          	bge	t0,a1,3b5c <ee_printf+0x660>
    3c8c:	03c5c3b3          	div	t2,a1,t3
    3c90:	42010b93          	addi	s7,sp,1056
    3c94:	011b8c33          	add	s8,s7,a7
    3c98:	00080b93          	mv	s7,a6
    3c9c:	00288813          	addi	a6,a7,2
    3ca0:	007408b3          	add	a7,s0,t2
    3ca4:	0008c883          	lbu	a7,0(a7)
    3ca8:	03c5e5b3          	rem	a1,a1,t3
    3cac:	bf1c0423          	sb	a7,-1048(s8)
    3cb0:	eadff06f          	j	3b5c <ee_printf+0x660>
    3cb4:	00000493          	li	s1,0
    3cb8:	929ff06f          	j	35e0 <ee_printf+0xe4>
    3cbc:	000b8613          	mv	a2,s7
    3cc0:	e05ff06f          	j	3ac4 <ee_printf+0x5c8>
    3cc4:	fff68813          	addi	a6,a3,-1
    3cc8:	08d7d463          	bge	a5,a3,3d50 <ee_printf+0x854>
    3ccc:	40f68733          	sub	a4,a3,a5
    3cd0:	00e50733          	add	a4,a0,a4
    3cd4:	02000593          	li	a1,32
    3cd8:	00150513          	addi	a0,a0,1
    3cdc:	feb50fa3          	sb	a1,-1(a0)
    3ce0:	fea71ce3          	bne	a4,a0,3cd8 <ee_printf+0x7dc>
    3ce4:	40d786b3          	sub	a3,a5,a3
    3ce8:	010686b3          	add	a3,a3,a6
    3cec:	b35ff06f          	j	3820 <ee_printf+0x324>
    3cf0:	0107f793          	andi	a5,a5,16
    3cf4:	06078263          	beqz	a5,3d58 <ee_printf+0x85c>
    3cf8:	00050713          	mv	a4,a0
    3cfc:	00000793          	li	a5,0
    3d00:	b45ff06f          	j	3844 <ee_printf+0x348>
    3d04:	0009a783          	lw	a5,0(s3)
    3d08:	00150613          	addi	a2,a0,1
    3d0c:	00498993          	addi	s3,s3,4
    3d10:	00f50023          	sb	a5,0(a0)
    3d14:	001b8313          	addi	t1,s7,1
    3d18:	001bc783          	lbu	a5,1(s7)
    3d1c:	00060513          	mv	a0,a2
    3d20:	860796e3          	bnez	a5,358c <ee_printf+0x90>
    3d24:	885ff06f          	j	35a8 <ee_printf+0xac>
    3d28:	00250513          	addi	a0,a0,2
    3d2c:	f0dff06f          	j	3c38 <ee_printf+0x73c>
    3d30:	001bc783          	lbu	a5,1(s7)
    3d34:	00070513          	mv	a0,a4
    3d38:	84079ae3          	bnez	a5,358c <ee_printf+0x90>
    3d3c:	86dff06f          	j	35a8 <ee_printf+0xac>
    3d40:	ffe68793          	addi	a5,a3,-2
    3d44:	00088693          	mv	a3,a7
    3d48:	00078893          	mv	a7,a5
    3d4c:	e61ff06f          	j	3bac <ee_printf+0x6b0>
    3d50:	00080693          	mv	a3,a6
    3d54:	acdff06f          	j	3820 <ee_printf+0x324>
    3d58:	fff68813          	addi	a6,a3,-1
    3d5c:	f6d048e3          	bgtz	a3,3ccc <ee_printf+0x7d0>
    3d60:	00080693          	mv	a3,a6
    3d64:	00050713          	mv	a4,a0
    3d68:	addff06f          	j	3844 <ee_printf+0x348>
    3d6c:	ffe68793          	addi	a5,a3,-2
    3d70:	00088693          	mv	a3,a7
    3d74:	00078893          	mv	a7,a5
    3d78:	c99ff06f          	j	3a10 <ee_printf+0x514>
    3d7c:	00050713          	mv	a4,a0
    3d80:	ac5ff06f          	j	3844 <ee_printf+0x348>

00003d84 <__udivdi3>:
    3d84:	00058793          	mv	a5,a1
    3d88:	00060813          	mv	a6,a2
    3d8c:	00068713          	mv	a4,a3
    3d90:	00050313          	mv	t1,a0
    3d94:	28069663          	bnez	a3,4020 <__udivdi3+0x29c>
    3d98:	00002897          	auipc	a7,0x2
    3d9c:	1ac88893          	addi	a7,a7,428 # 5f44 <__clz_tab>
    3da0:	0ec5f663          	bgeu	a1,a2,3e8c <__udivdi3+0x108>
    3da4:	00010737          	lui	a4,0x10
    3da8:	0ce67863          	bgeu	a2,a4,3e78 <__udivdi3+0xf4>
    3dac:	0ff00713          	li	a4,255
    3db0:	00c73733          	sltu	a4,a4,a2
    3db4:	00371713          	slli	a4,a4,0x3
    3db8:	00e656b3          	srl	a3,a2,a4
    3dbc:	00d888b3          	add	a7,a7,a3
    3dc0:	0008c683          	lbu	a3,0(a7)
    3dc4:	00e68733          	add	a4,a3,a4
    3dc8:	02000693          	li	a3,32
    3dcc:	40e686b3          	sub	a3,a3,a4
    3dd0:	00068c63          	beqz	a3,3de8 <__udivdi3+0x64>
    3dd4:	00d797b3          	sll	a5,a5,a3
    3dd8:	00e55733          	srl	a4,a0,a4
    3ddc:	00d61833          	sll	a6,a2,a3
    3de0:	00f765b3          	or	a1,a4,a5
    3de4:	00d51333          	sll	t1,a0,a3
    3de8:	01085513          	srli	a0,a6,0x10
    3dec:	02a5f733          	remu	a4,a1,a0
    3df0:	01081613          	slli	a2,a6,0x10
    3df4:	01065613          	srli	a2,a2,0x10
    3df8:	01035693          	srli	a3,t1,0x10
    3dfc:	02a5d5b3          	divu	a1,a1,a0
    3e00:	01071713          	slli	a4,a4,0x10
    3e04:	00d766b3          	or	a3,a4,a3
    3e08:	02b607b3          	mul	a5,a2,a1
    3e0c:	00058713          	mv	a4,a1
    3e10:	00f6fe63          	bgeu	a3,a5,3e2c <__udivdi3+0xa8>
    3e14:	010686b3          	add	a3,a3,a6
    3e18:	fff58713          	addi	a4,a1,-1
    3e1c:	0106e863          	bltu	a3,a6,3e2c <__udivdi3+0xa8>
    3e20:	00f6f663          	bgeu	a3,a5,3e2c <__udivdi3+0xa8>
    3e24:	ffe58713          	addi	a4,a1,-2
    3e28:	010686b3          	add	a3,a3,a6
    3e2c:	40f686b3          	sub	a3,a3,a5
    3e30:	02a6f7b3          	remu	a5,a3,a0
    3e34:	01031313          	slli	t1,t1,0x10
    3e38:	01035313          	srli	t1,t1,0x10
    3e3c:	02a6d6b3          	divu	a3,a3,a0
    3e40:	01079793          	slli	a5,a5,0x10
    3e44:	0067e333          	or	t1,a5,t1
    3e48:	02d605b3          	mul	a1,a2,a3
    3e4c:	00068513          	mv	a0,a3
    3e50:	00b37c63          	bgeu	t1,a1,3e68 <__udivdi3+0xe4>
    3e54:	00680333          	add	t1,a6,t1
    3e58:	fff68513          	addi	a0,a3,-1
    3e5c:	01036663          	bltu	t1,a6,3e68 <__udivdi3+0xe4>
    3e60:	00b37463          	bgeu	t1,a1,3e68 <__udivdi3+0xe4>
    3e64:	ffe68513          	addi	a0,a3,-2
    3e68:	01071713          	slli	a4,a4,0x10
    3e6c:	00a76733          	or	a4,a4,a0
    3e70:	00000593          	li	a1,0
    3e74:	0e40006f          	j	3f58 <__udivdi3+0x1d4>
    3e78:	010006b7          	lui	a3,0x1000
    3e7c:	01000713          	li	a4,16
    3e80:	f2d66ce3          	bltu	a2,a3,3db8 <__udivdi3+0x34>
    3e84:	01800713          	li	a4,24
    3e88:	f31ff06f          	j	3db8 <__udivdi3+0x34>
    3e8c:	00061663          	bnez	a2,3e98 <__udivdi3+0x114>
    3e90:	00100693          	li	a3,1
    3e94:	02c6d833          	divu	a6,a3,a2
    3e98:	000106b7          	lui	a3,0x10
    3e9c:	0cd87263          	bgeu	a6,a3,3f60 <__udivdi3+0x1dc>
    3ea0:	0ff00693          	li	a3,255
    3ea4:	0106f463          	bgeu	a3,a6,3eac <__udivdi3+0x128>
    3ea8:	00800713          	li	a4,8
    3eac:	00e856b3          	srl	a3,a6,a4
    3eb0:	00d888b3          	add	a7,a7,a3
    3eb4:	0008c683          	lbu	a3,0(a7)
    3eb8:	00e686b3          	add	a3,a3,a4
    3ebc:	02000713          	li	a4,32
    3ec0:	40d70733          	sub	a4,a4,a3
    3ec4:	0a071863          	bnez	a4,3f74 <__udivdi3+0x1f0>
    3ec8:	410787b3          	sub	a5,a5,a6
    3ecc:	00100593          	li	a1,1
    3ed0:	01085613          	srli	a2,a6,0x10
    3ed4:	01081893          	slli	a7,a6,0x10
    3ed8:	0108d893          	srli	a7,a7,0x10
    3edc:	01035693          	srli	a3,t1,0x10
    3ee0:	02c7f733          	remu	a4,a5,a2
    3ee4:	02c7d7b3          	divu	a5,a5,a2
    3ee8:	01071713          	slli	a4,a4,0x10
    3eec:	00d766b3          	or	a3,a4,a3
    3ef0:	02f88533          	mul	a0,a7,a5
    3ef4:	00078713          	mv	a4,a5
    3ef8:	00a6fe63          	bgeu	a3,a0,3f14 <__udivdi3+0x190>
    3efc:	010686b3          	add	a3,a3,a6
    3f00:	fff78713          	addi	a4,a5,-1
    3f04:	0106e863          	bltu	a3,a6,3f14 <__udivdi3+0x190>
    3f08:	00a6f663          	bgeu	a3,a0,3f14 <__udivdi3+0x190>
    3f0c:	ffe78713          	addi	a4,a5,-2
    3f10:	010686b3          	add	a3,a3,a6
    3f14:	40a686b3          	sub	a3,a3,a0
    3f18:	02c6f7b3          	remu	a5,a3,a2
    3f1c:	01031313          	slli	t1,t1,0x10
    3f20:	01035313          	srli	t1,t1,0x10
    3f24:	02c6d6b3          	divu	a3,a3,a2
    3f28:	01079793          	slli	a5,a5,0x10
    3f2c:	0067e333          	or	t1,a5,t1
    3f30:	02d888b3          	mul	a7,a7,a3
    3f34:	00068513          	mv	a0,a3
    3f38:	01137c63          	bgeu	t1,a7,3f50 <__udivdi3+0x1cc>
    3f3c:	00680333          	add	t1,a6,t1
    3f40:	fff68513          	addi	a0,a3,-1 # ffff <__global_pointer$+0x97af>
    3f44:	01036663          	bltu	t1,a6,3f50 <__udivdi3+0x1cc>
    3f48:	01137463          	bgeu	t1,a7,3f50 <__udivdi3+0x1cc>
    3f4c:	ffe68513          	addi	a0,a3,-2
    3f50:	01071713          	slli	a4,a4,0x10
    3f54:	00a76733          	or	a4,a4,a0
    3f58:	00070513          	mv	a0,a4
    3f5c:	00008067          	ret
    3f60:	010006b7          	lui	a3,0x1000
    3f64:	01000713          	li	a4,16
    3f68:	f4d862e3          	bltu	a6,a3,3eac <__udivdi3+0x128>
    3f6c:	01800713          	li	a4,24
    3f70:	f3dff06f          	j	3eac <__udivdi3+0x128>
    3f74:	00e81833          	sll	a6,a6,a4
    3f78:	00d7d5b3          	srl	a1,a5,a3
    3f7c:	00e51333          	sll	t1,a0,a4
    3f80:	00d556b3          	srl	a3,a0,a3
    3f84:	01085513          	srli	a0,a6,0x10
    3f88:	00e797b3          	sll	a5,a5,a4
    3f8c:	02a5f733          	remu	a4,a1,a0
    3f90:	00f6e8b3          	or	a7,a3,a5
    3f94:	01081793          	slli	a5,a6,0x10
    3f98:	0107d793          	srli	a5,a5,0x10
    3f9c:	0108d613          	srli	a2,a7,0x10
    3fa0:	02a5d5b3          	divu	a1,a1,a0
    3fa4:	01071713          	slli	a4,a4,0x10
    3fa8:	00c76733          	or	a4,a4,a2
    3fac:	02b786b3          	mul	a3,a5,a1
    3fb0:	00058613          	mv	a2,a1
    3fb4:	00d77e63          	bgeu	a4,a3,3fd0 <__udivdi3+0x24c>
    3fb8:	01070733          	add	a4,a4,a6
    3fbc:	fff58613          	addi	a2,a1,-1
    3fc0:	01076863          	bltu	a4,a6,3fd0 <__udivdi3+0x24c>
    3fc4:	00d77663          	bgeu	a4,a3,3fd0 <__udivdi3+0x24c>
    3fc8:	ffe58613          	addi	a2,a1,-2
    3fcc:	01070733          	add	a4,a4,a6
    3fd0:	40d706b3          	sub	a3,a4,a3
    3fd4:	02a6f733          	remu	a4,a3,a0
    3fd8:	01089893          	slli	a7,a7,0x10
    3fdc:	0108d893          	srli	a7,a7,0x10
    3fe0:	02a6d6b3          	divu	a3,a3,a0
    3fe4:	01071713          	slli	a4,a4,0x10
    3fe8:	02d785b3          	mul	a1,a5,a3
    3fec:	011767b3          	or	a5,a4,a7
    3ff0:	00068713          	mv	a4,a3
    3ff4:	00b7fe63          	bgeu	a5,a1,4010 <__udivdi3+0x28c>
    3ff8:	010787b3          	add	a5,a5,a6
    3ffc:	fff68713          	addi	a4,a3,-1 # ffffff <__stack_top+0xfeffff>
    4000:	0107e863          	bltu	a5,a6,4010 <__udivdi3+0x28c>
    4004:	00b7f663          	bgeu	a5,a1,4010 <__udivdi3+0x28c>
    4008:	ffe68713          	addi	a4,a3,-2
    400c:	010787b3          	add	a5,a5,a6
    4010:	40b787b3          	sub	a5,a5,a1
    4014:	01061593          	slli	a1,a2,0x10
    4018:	00e5e5b3          	or	a1,a1,a4
    401c:	eb5ff06f          	j	3ed0 <__udivdi3+0x14c>
    4020:	18d5e663          	bltu	a1,a3,41ac <__udivdi3+0x428>
    4024:	00010737          	lui	a4,0x10
    4028:	04e6f463          	bgeu	a3,a4,4070 <__udivdi3+0x2ec>
    402c:	0ff00813          	li	a6,255
    4030:	00d83733          	sltu	a4,a6,a3
    4034:	00371713          	slli	a4,a4,0x3
    4038:	00e6d833          	srl	a6,a3,a4
    403c:	00002597          	auipc	a1,0x2
    4040:	f0858593          	addi	a1,a1,-248 # 5f44 <__clz_tab>
    4044:	010585b3          	add	a1,a1,a6
    4048:	0005c803          	lbu	a6,0(a1)
    404c:	02000593          	li	a1,32
    4050:	00e80833          	add	a6,a6,a4
    4054:	410585b3          	sub	a1,a1,a6
    4058:	02059663          	bnez	a1,4084 <__udivdi3+0x300>
    405c:	00100713          	li	a4,1
    4060:	eef6ece3          	bltu	a3,a5,3f58 <__udivdi3+0x1d4>
    4064:	00c53533          	sltu	a0,a0,a2
    4068:	00154713          	xori	a4,a0,1
    406c:	eedff06f          	j	3f58 <__udivdi3+0x1d4>
    4070:	010005b7          	lui	a1,0x1000
    4074:	01000713          	li	a4,16
    4078:	fcb6e0e3          	bltu	a3,a1,4038 <__udivdi3+0x2b4>
    407c:	01800713          	li	a4,24
    4080:	fb9ff06f          	j	4038 <__udivdi3+0x2b4>
    4084:	01065733          	srl	a4,a2,a6
    4088:	00b696b3          	sll	a3,a3,a1
    408c:	00d766b3          	or	a3,a4,a3
    4090:	0106de93          	srli	t4,a3,0x10
    4094:	0107d733          	srl	a4,a5,a6
    4098:	03d778b3          	remu	a7,a4,t4
    409c:	00b797b3          	sll	a5,a5,a1
    40a0:	01055833          	srl	a6,a0,a6
    40a4:	00f86333          	or	t1,a6,a5
    40a8:	01069793          	slli	a5,a3,0x10
    40ac:	0107d793          	srli	a5,a5,0x10
    40b0:	01035813          	srli	a6,t1,0x10
    40b4:	00b61633          	sll	a2,a2,a1
    40b8:	03d75733          	divu	a4,a4,t4
    40bc:	01089893          	slli	a7,a7,0x10
    40c0:	0108e833          	or	a6,a7,a6
    40c4:	02e78f33          	mul	t5,a5,a4
    40c8:	00070e13          	mv	t3,a4
    40cc:	01e87e63          	bgeu	a6,t5,40e8 <__udivdi3+0x364>
    40d0:	00d80833          	add	a6,a6,a3
    40d4:	fff70e13          	addi	t3,a4,-1 # ffff <__global_pointer$+0x97af>
    40d8:	00d86863          	bltu	a6,a3,40e8 <__udivdi3+0x364>
    40dc:	01e87663          	bgeu	a6,t5,40e8 <__udivdi3+0x364>
    40e0:	ffe70e13          	addi	t3,a4,-2
    40e4:	00d80833          	add	a6,a6,a3
    40e8:	41e80833          	sub	a6,a6,t5
    40ec:	03d878b3          	remu	a7,a6,t4
    40f0:	03d85833          	divu	a6,a6,t4
    40f4:	01089893          	slli	a7,a7,0x10
    40f8:	03078eb3          	mul	t4,a5,a6
    40fc:	01031793          	slli	a5,t1,0x10
    4100:	0107d793          	srli	a5,a5,0x10
    4104:	00f8e7b3          	or	a5,a7,a5
    4108:	00080713          	mv	a4,a6
    410c:	01d7fe63          	bgeu	a5,t4,4128 <__udivdi3+0x3a4>
    4110:	00d787b3          	add	a5,a5,a3
    4114:	fff80713          	addi	a4,a6,-1
    4118:	00d7e863          	bltu	a5,a3,4128 <__udivdi3+0x3a4>
    411c:	01d7f663          	bgeu	a5,t4,4128 <__udivdi3+0x3a4>
    4120:	ffe80713          	addi	a4,a6,-2
    4124:	00d787b3          	add	a5,a5,a3
    4128:	010e1e13          	slli	t3,t3,0x10
    412c:	41d787b3          	sub	a5,a5,t4
    4130:	00010eb7          	lui	t4,0x10
    4134:	00ee6733          	or	a4,t3,a4
    4138:	fffe8813          	addi	a6,t4,-1 # ffff <__global_pointer$+0x97af>
    413c:	01077333          	and	t1,a4,a6
    4140:	01075893          	srli	a7,a4,0x10
    4144:	01067833          	and	a6,a2,a6
    4148:	01065613          	srli	a2,a2,0x10
    414c:	03030e33          	mul	t3,t1,a6
    4150:	03088833          	mul	a6,a7,a6
    4154:	010e5693          	srli	a3,t3,0x10
    4158:	02c30333          	mul	t1,t1,a2
    415c:	01030333          	add	t1,t1,a6
    4160:	006686b3          	add	a3,a3,t1
    4164:	02c888b3          	mul	a7,a7,a2
    4168:	0106f463          	bgeu	a3,a6,4170 <__udivdi3+0x3ec>
    416c:	01d888b3          	add	a7,a7,t4
    4170:	0106d613          	srli	a2,a3,0x10
    4174:	011608b3          	add	a7,a2,a7
    4178:	0317e663          	bltu	a5,a7,41a4 <__udivdi3+0x420>
    417c:	cf179ae3          	bne	a5,a7,3e70 <__udivdi3+0xec>
    4180:	000107b7          	lui	a5,0x10
    4184:	fff78793          	addi	a5,a5,-1 # ffff <__global_pointer$+0x97af>
    4188:	00f6f6b3          	and	a3,a3,a5
    418c:	01069693          	slli	a3,a3,0x10
    4190:	00fe7e33          	and	t3,t3,a5
    4194:	00b51533          	sll	a0,a0,a1
    4198:	01c686b3          	add	a3,a3,t3
    419c:	00000593          	li	a1,0
    41a0:	dad57ce3          	bgeu	a0,a3,3f58 <__udivdi3+0x1d4>
    41a4:	fff70713          	addi	a4,a4,-1
    41a8:	cc9ff06f          	j	3e70 <__udivdi3+0xec>
    41ac:	00000593          	li	a1,0
    41b0:	00000713          	li	a4,0
    41b4:	da5ff06f          	j	3f58 <__udivdi3+0x1d4>
    41b8:	5d4c435b          	0x5d4c435b
    41bc:	4320                	lw	s0,64(a4)
    41be:	4c41                	li	s8,16
    41c0:	4e455f43          	fmadd.q	ft10,fa0,ft4,fs1,unknown
    41c4:	4554                	lw	a3,12(a0)
    41c6:	2052                	fld	ft0,272(sp)
    41c8:	3d6e                	fld	fs10,248(sp)
    41ca:	6c25                	lui	s8,0x9
    41cc:	2075                	jal	4278 <__udivdi3+0x4f4>
    41ce:	6470                	flw	fa2,76(s0)
    41d0:	7461                	lui	s0,0xffff8
    41d2:	3d61                	jal	406a <__udivdi3+0x2e6>
    41d4:	7830                	flw	fa2,112(s0)
    41d6:	3025                	jal	39fe <ee_printf+0x502>
    41d8:	6c38                	flw	fa4,88(s0)
    41da:	2078                	fld	fa4,192(s0)
    41dc:	6572                	flw	fa0,28(sp)
    41de:	78303d73          	csrrc	s10,0x783,zero
    41e2:	3025                	jal	3a0a <ee_printf+0x50e>
    41e4:	6c38                	flw	fa4,88(s0)
    41e6:	0d78                	addi	a4,sp,668
    41e8:	000a                	c.slli	zero,0x2
    41ea:	0000                	unimp
    41ec:	5d4c435b          	0x5d4c435b
    41f0:	4320                	lw	s0,64(a4)
    41f2:	4c41                	li	s8,16
    41f4:	41445f43          	fmadd.s	ft10,fs0,fs4,fs0,unknown
    41f8:	4154                	lw	a3,4(a0)
    41fa:	6420                	flw	fs0,72(s0)
    41fc:	7461                	lui	s0,0xffff8
    41fe:	3d61                	jal	4096 <__udivdi3+0x312>
    4200:	7830                	flw	fa2,112(s0)
    4202:	3025                	jal	3a2a <ee_printf+0x52e>
    4204:	7834                	flw	fa3,112(s0)
    4206:	6f20                	flw	fs0,88(a4)
    4208:	7470                	flw	fa2,108(s0)
    420a:	7079                	c.lui	zero,0xffffe
    420c:	3d65                	jal	40c4 <__udivdi3+0x340>
    420e:	7525                	lui	a0,0xfffe9
    4210:	0a0d                	addi	s4,s4,3
    4212:	0000                	unimp
    4214:	5d4c435b          	0x5d4c435b
    4218:	4320                	lw	s0,64(a4)
    421a:	4c41                	li	s8,16
    421c:	45445f43          	0x45445f43
    4220:	4146                	lw	sp,80(sp)
    4222:	4c55                	li	s8,21
    4224:	2054                	fld	fa3,128(s0)
    4226:	6572                	flw	fa0,28(sp)
    4228:	7674                	flw	fa3,108(a2)
    422a:	6c61                	lui	s8,0x18
    422c:	303d                	jal	3a5a <ee_printf+0x55e>
    422e:	2578                	fld	fa4,200(a0)
    4230:	3430                	fld	fa2,104(s0)
    4232:	0d78                	addi	a4,sp,668
    4234:	000a                	c.slli	zero,0x2
    4236:	0000                	unimp
    4238:	5d4c435b          	0x5d4c435b
    423c:	4320                	lw	s0,64(a4)
    423e:	4c41                	li	s8,16
    4240:	52435f43          	fmadd.d	ft10,ft6,ft4,fa0,unknown
    4244:	45425f43          	0x45425f43
    4248:	204e4947          	fmsub.s	fs2,ft8,ft4,ft4,rmm
    424c:	6572                	flw	fa0,28(sp)
    424e:	7674                	flw	fa3,108(a2)
    4250:	6c61                	lui	s8,0x18
    4252:	303d                	jal	3a80 <ee_printf+0x584>
    4254:	2578                	fld	fa4,200(a0)
    4256:	3430                	fld	fa2,104(s0)
    4258:	2078                	fld	fa4,192(s0)
    425a:	63646c6f          	jal	s8,4a890 <__stack_top+0x3a890>
    425e:	6372                	flw	ft6,28(sp)
    4260:	303d                	jal	3a8e <ee_printf+0x592>
    4262:	2578                	fld	fa4,200(a0)
    4264:	3430                	fld	fa2,104(s0)
    4266:	0d78                	addi	a4,sp,668
    4268:	000a                	c.slli	zero,0x2
    426a:	0000                	unimp
    426c:	5d4c435b          	0x5d4c435b
    4270:	4320                	lw	s0,64(a4)
    4272:	4c41                	li	s8,16
    4274:	54535f43          	0x54535f43
    4278:	5f45524f          	fnmadd.q	ft4,fa0,fs4,fa1,unknown
    427c:	4542                	lw	a0,16(sp)
    427e:	204e4947          	fmsub.s	fs2,ft8,ft4,ft4,rmm
    4282:	6470                	flw	fa2,76(s0)
    4284:	7461                	lui	s0,0xffff8
    4286:	3d61                	jal	411e <__udivdi3+0x39a>
    4288:	7830                	flw	fa2,112(s0)
    428a:	3025                	jal	3ab2 <ee_printf+0x5b6>
    428c:	6c38                	flw	fa4,88(s0)
    428e:	2078                	fld	fa4,192(s0)
    4290:	726f7473          	csrrci	s0,0x726,30
    4294:	3d65                	jal	414c <__udivdi3+0x3c8>
    4296:	7830                	flw	fa2,112(s0)
    4298:	3025                	jal	3ac0 <ee_printf+0x5c4>
    429a:	7834                	flw	fa3,112(s0)
    429c:	0a0d                	addi	s4,s4,3
    429e:	0000                	unimp
    42a0:	5d4c435b          	0x5d4c435b
    42a4:	4320                	lw	s0,64(a4)
    42a6:	4c41                	li	s8,16
    42a8:	4f445f43          	fmadd.q	ft10,fs0,fs4,fs1,unknown
    42ac:	454e                	lw	a0,208(sp)
    42ae:	7220                	flw	fs0,96(a2)
    42b0:	7465                	lui	s0,0xffff9
    42b2:	6176                	flw	ft2,92(sp)
    42b4:	3d6c                	fld	fa1,248(a0)
    42b6:	7830                	flw	fa2,112(s0)
    42b8:	3025                	jal	3ae0 <ee_printf+0x5e4>
    42ba:	7834                	flw	fa3,112(s0)
    42bc:	6e20                	flw	fs0,88(a2)
    42be:	7765                	lui	a4,0xffff9
    42c0:	3d637263          	bgeu	t1,s6,4684 <__udivdi3+0x900>
    42c4:	7830                	flw	fa2,112(s0)
    42c6:	3025                	jal	3aee <ee_printf+0x5f2>
    42c8:	7834                	flw	fa3,112(s0)
    42ca:	0a0d                	addi	s4,s4,3
    42cc:	0000                	unimp
    42ce:	0000                	unimp
    42d0:	5d4c435b          	0x5d4c435b
    42d4:	4320                	lw	s0,64(a4)
    42d6:	4c41                	li	s8,16
    42d8:	41435f43          	fmadd.s	ft10,ft6,fs4,fs0,unknown
    42dc:	44454843          	0x44454843
    42e0:	7220                	flw	fs0,96(a2)
    42e2:	7465                	lui	s0,0xffff9
    42e4:	6176                	flw	ft2,92(sp)
    42e6:	3d6c                	fld	fa1,248(a0)
    42e8:	7830                	flw	fa2,112(s0)
    42ea:	3025                	jal	3b12 <ee_printf+0x616>
    42ec:	7834                	flw	fa3,112(s0)
    42ee:	0a0d                	addi	s4,s4,3
    42f0:	0000                	unimp
    42f2:	0000                	unimp
    42f4:	5d4c435b          	0x5d4c435b
    42f8:	4320                	lw	s0,64(a4)
    42fa:	4c41                	li	s8,16
    42fc:	45445f43          	0x45445f43
    4300:	45444f43          	0x45444f43
    4304:	6620                	flw	fs0,72(a2)
    4306:	616c                	flw	fa1,68(a0)
    4308:	64253d67          	0x64253d67
    430c:	6420                	flw	fs0,72(s0)
    430e:	7974                	flw	fa3,116(a0)
    4310:	6570                	flw	fa2,76(a0)
    4312:	3d30                	fld	fa2,120(a0)
    4314:	7830                	flw	fa2,112(s0)
    4316:	3025                	jal	3b3e <ee_printf+0x642>
    4318:	7834                	flw	fa3,112(s0)
    431a:	7320                	flw	fs0,96(a4)
    431c:	7a69                	lui	s4,0xffffa
    431e:	3d65                	jal	41d6 <__udivdi3+0x452>
    4320:	6c25                	lui	s8,0x9
    4322:	2075                	jal	43ce <__udivdi3+0x64a>
    4324:	656d                	lui	a0,0x1b
    4326:	336d                	jal	40d0 <__udivdi3+0x34c>
    4328:	303d                	jal	3b56 <ee_printf+0x65a>
    432a:	2578                	fld	fa4,200(a0)
    432c:	3830                	fld	fa2,112(s0)
    432e:	786c                	flw	fa1,116(s0)
    4330:	6d20                	flw	fs0,88(a0)
    4332:	7461                	lui	s0,0xffff8
    4334:	3d4e                	fld	fs10,240(sp)
    4336:	6425                	lui	s0,0x9
    4338:	6320                	flw	fs0,64(a4)
    433a:	6372                	flw	ft6,28(sp)
    433c:	303d                	jal	3b6a <ee_printf+0x66e>
    433e:	2578                	fld	fa4,200(a0)
    4340:	3430                	fld	fa2,104(s0)
    4342:	0d78                	addi	a4,sp,668
    4344:	000a                	c.slli	zero,0x2
    4346:	0000                	unimp
    4348:	5d4c435b          	0x5d4c435b
    434c:	4320                	lw	s0,64(a4)
    434e:	4c41                	li	s8,16
    4350:	41435f43          	fmadd.s	ft10,ft6,fs4,fs0,unknown
    4354:	4c4c                	lw	a1,28(s0)
    4356:	535f 4154 4554      	0x45544154535f
    435c:	7320                	flw	fs0,96(a4)
    435e:	6574                	flw	fa3,76(a0)
    4360:	3d70                	fld	fa2,248(a0)
    4362:	7830                	flw	fa2,112(s0)
    4364:	3025                	jal	3b8c <ee_printf+0x690>
    4366:	7834                	flw	fa3,112(s0)
    4368:	0a0d                	addi	s4,s4,3
    436a:	0000                	unimp
    436c:	5d4c435b          	0x5d4c435b
    4370:	4320                	lw	s0,64(a4)
    4372:	4c41                	li	s8,16
    4374:	45525f43          	0x45525f43
    4378:	5f54                	lw	a3,60(a4)
    437a:	54415453          	0x54415453
    437e:	2045                	jal	441e <__udivdi3+0x69a>
    4380:	6572                	flw	fa0,28(sp)
    4382:	7674                	flw	fa3,108(a2)
    4384:	6c61                	lui	s8,0x18
    4386:	303d                	jal	3bb4 <ee_printf+0x6b8>
    4388:	2578                	fld	fa4,200(a0)
    438a:	3430                	fld	fa2,104(s0)
    438c:	0d78                	addi	a4,sp,668
    438e:	000a                	c.slli	zero,0x2
    4390:	5d4c435b          	0x5d4c435b
    4394:	4320                	lw	s0,64(a4)
    4396:	4c41                	li	s8,16
    4398:	41435f43          	fmadd.s	ft10,ft6,fs4,fs0,unknown
    439c:	4c4c                	lw	a1,28(s0)
    439e:	4d5f 5441 4952      	0x495254414d5f
    43a4:	2058                	fld	fa4,128(s0)
    43a6:	64656573          	csrrsi	a0,0x646,10
    43aa:	303d                	jal	3bd8 <ee_printf+0x6dc>
    43ac:	2578                	fld	fa4,200(a0)
    43ae:	3430                	fld	fa2,104(s0)
    43b0:	0d78                	addi	a4,sp,668
    43b2:	000a                	c.slli	zero,0x2
    43b4:	5d4c435b          	0x5d4c435b
    43b8:	4320                	lw	s0,64(a4)
    43ba:	4c41                	li	s8,16
    43bc:	45525f43          	0x45525f43
    43c0:	5f54                	lw	a3,60(a4)
    43c2:	414d                	li	sp,19
    43c4:	5254                	lw	a3,36(a2)
    43c6:	5849                	li	a6,-14
    43c8:	7220                	flw	fs0,96(a2)
    43ca:	7465                	lui	s0,0xffff9
    43cc:	6176                	flw	ft2,92(sp)
    43ce:	3d6c                	fld	fa1,248(a0)
    43d0:	7830                	flw	fa2,112(s0)
    43d2:	3025                	jal	3bfa <ee_printf+0x6fe>
    43d4:	7834                	flw	fa3,112(s0)
    43d6:	0a0d                	addi	s4,s4,3
    43d8:	0000                	unimp
    43da:	0000                	unimp
    43dc:	5d4c435b          	0x5d4c435b
    43e0:	4320                	lw	s0,64(a4)
    43e2:	504d                	c.li	zero,-13
    43e4:	455f 544e 5245      	0x5245544e455f
    43ea:	6e20                	flw	fs0,88(a2)
    43ec:	253d                	jal	4a1a <__udivdi3+0xc96>
    43ee:	756c                	flw	fa1,108(a0)
    43f0:	6120                	flw	fs0,64(a0)
    43f2:	303d                	jal	3c20 <ee_printf+0x724>
    43f4:	2578                	fld	fa4,200(a0)
    43f6:	3830                	fld	fa2,112(s0)
    43f8:	786c                	flw	fa1,116(s0)
    43fa:	6220                	flw	fs0,64(a2)
    43fc:	303d                	jal	3c2a <ee_printf+0x72e>
    43fe:	2578                	fld	fa4,200(a0)
    4400:	3830                	fld	fa2,112(s0)
    4402:	786c                	flw	fa1,116(s0)
    4404:	6120                	flw	fs0,64(a0)
    4406:	6e69                	lui	t3,0x1a
    4408:	6f66                	flw	ft10,88(sp)
    440a:	303d                	jal	3c38 <ee_printf+0x73c>
    440c:	2578                	fld	fa4,200(a0)
    440e:	3830                	fld	fa2,112(s0)
    4410:	786c                	flw	fa1,116(s0)
    4412:	6220                	flw	fs0,64(a2)
    4414:	6e69                	lui	t3,0x1a
    4416:	6f66                	flw	ft10,88(sp)
    4418:	303d                	jal	3c46 <ee_printf+0x74a>
    441a:	2578                	fld	fa4,200(a0)
    441c:	3830                	fld	fa2,112(s0)
    441e:	786c                	flw	fa1,116(s0)
    4420:	0a0d                	addi	s4,s4,3
    4422:	0000                	unimp
    4424:	5d4c435b          	0x5d4c435b
    4428:	4320                	lw	s0,64(a4)
    442a:	504d                	c.li	zero,-13
    442c:	415f 5446 5245      	0x52455446415f
    4432:	415f 7620 6c61      	0x6c617620415f
    4438:	3d31                	jal	4254 <__udivdi3+0x4d0>
    443a:	7830                	flw	fa2,112(s0)
    443c:	3025                	jal	3c64 <ee_printf+0x768>
    443e:	7834                	flw	fa3,112(s0)
    4440:	0a0d                	addi	s4,s4,3
    4442:	0000                	unimp
    4444:	5d4c435b          	0x5d4c435b
    4448:	4320                	lw	s0,64(a4)
    444a:	504d                	c.li	zero,-13
    444c:	445f 4e4f 2045      	0x20454e4f445f
    4452:	6176                	flw	ft2,92(sp)
    4454:	316c                	fld	fa1,224(a0)
    4456:	303d                	jal	3c84 <ee_printf+0x788>
    4458:	2578                	fld	fa4,200(a0)
    445a:	3430                	fld	fa2,104(s0)
    445c:	2078                	fld	fa4,192(s0)
    445e:	6176                	flw	ft2,92(sp)
    4460:	326c                	fld	fa1,224(a2)
    4462:	303d                	jal	3c90 <ee_printf+0x794>
    4464:	2578                	fld	fa4,200(a0)
    4466:	3430                	fld	fa2,104(s0)
    4468:	2078                	fld	fa4,192(s0)
    446a:	6964                	flw	fs1,84(a0)
    446c:	6666                	flw	fa2,88(sp)
    446e:	253d                	jal	4a9c <__udivdi3+0xd18>
    4470:	646c                	flw	fa1,76(s0)
    4472:	0a0d                	addi	s4,s4,3
    4474:	0000                	unimp
    4476:	0000                	unimp
    4478:	5d4c435b          	0x5d4c435b
    447c:	4520                	lw	s0,72(a0)
    447e:	544e                	lw	s0,240(sp)
    4480:	5245                	li	tp,-15
    4482:	6220                	flw	fs0,64(a2)
    4484:	6b6c                	flw	fa1,84(a4)
    4486:	657a6973          	csrrsi	s2,0x657,20
    448a:	253d                	jal	4ab8 <__udivdi3+0xd34>
    448c:	756c                	flw	fa1,108(a0)
    448e:	6d20                	flw	fs0,88(a0)
    4490:	6d65                	lui	s10,0x19
    4492:	6c62                	flw	fs8,24(sp)
    4494:	3d6b636f          	jal	t1,ba86a <__stack_top+0xaa86a>
    4498:	7830                	flw	fa2,112(s0)
    449a:	3025                	jal	3cc2 <ee_printf+0x7c6>
    449c:	6c38                	flw	fa4,88(s0)
    449e:	2078                	fld	fa4,192(s0)
    44a0:	64656573          	csrrsi	a0,0x646,10
    44a4:	303d                	jal	3cd2 <ee_printf+0x7d6>
    44a6:	2578                	fld	fa4,200(a0)
    44a8:	3430                	fld	fa2,104(s0)
    44aa:	2078                	fld	fa4,192(s0)
    44ac:	6568                	flw	fa0,76(a0)
    44ae:	6461                	lui	s0,0x18
    44b0:	735f 3d7a 6c25      	0x6c253d7a735f
    44b6:	2075                	jal	4562 <__udivdi3+0x7de>
    44b8:	6164                	flw	fs1,68(a0)
    44ba:	6174                	flw	fa3,68(a0)
    44bc:	735f 3d7a 6c25      	0x6c253d7a735f
    44c2:	0d75                	addi	s10,s10,29
    44c4:	000a                	c.slli	zero,0x2
    44c6:	0000                	unimp
    44c8:	5d4c435b          	0x5d4c435b
    44cc:	5020                	lw	s0,96(s0)
    44ce:	5245                	li	tp,-15
    44d0:	495f 4554 204d      	0x204d4554495f
    44d6:	6570                	flw	fa2,76(a0)
    44d8:	5f72                	lw	t5,60(sp)
    44da:	7469                	lui	s0,0xffffa
    44dc:	6d65                	lui	s10,0x19
    44de:	253d                	jal	4b0c <__udivdi3+0xd88>
    44e0:	756c                	flw	fa1,108(a0)
    44e2:	0a0d                	addi	s4,s4,3
    44e4:	0000                	unimp
    44e6:	0000                	unimp
    44e8:	5d4c435b          	0x5d4c435b
    44ec:	5320                	lw	s0,96(a4)
    44ee:	5a49                	li	s4,-14
    44f0:	5f45                	li	t5,-15
    44f2:	4944                	lw	s1,20(a0)
    44f4:	5f56                	lw	t5,116(sp)
    44f6:	4542                	lw	a0,16(sp)
    44f8:	204e4947          	fmsub.s	fs2,ft8,ft4,ft4,rmm
    44fc:	6c62                	flw	fs8,24(sp)
    44fe:	7a69736b          	0x7a69736b
    4502:	3d65                	jal	43ba <__udivdi3+0x636>
    4504:	6c25                	lui	s8,0x9
    4506:	2075                	jal	45b2 <__udivdi3+0x82e>
    4508:	6570                	flw	fa2,76(a0)
    450a:	5f72                	lw	t5,60(sp)
    450c:	7469                	lui	s0,0xffffa
    450e:	6d65                	lui	s10,0x19
    4510:	253d                	jal	4b3e <__udivdi3+0xdba>
    4512:	756c                	flw	fa1,108(a0)
    4514:	0a0d                	addi	s4,s4,3
    4516:	0000                	unimp
    4518:	5d4c435b          	0x5d4c435b
    451c:	5320                	lw	s0,96(a4)
    451e:	5a49                	li	s4,-14
    4520:	5f45                	li	t5,-15
    4522:	4944                	lw	s1,20(a0)
    4524:	5f56                	lw	t5,116(sp)
    4526:	4f44                	lw	s1,28(a4)
    4528:	454e                	lw	a0,208(sp)
    452a:	7320                	flw	fs0,96(a4)
    452c:	7a69                	lui	s4,0xffffa
    452e:	3d65                	jal	43e6 <__udivdi3+0x662>
    4530:	6c25                	lui	s8,0x9
    4532:	0d75                	addi	s10,s10,29
    4534:	000a                	c.slli	zero,0x2
    4536:	0000                	unimp
    4538:	5d4c435b          	0x5d4c435b
    453c:	5020                	lw	s0,96(s0)
    453e:	5254                	lw	a3,36(a2)
    4540:	656d2053          	0x656d2053
    4544:	5f6d                	li	t5,-5
    4546:	6e65                	lui	t3,0x19
    4548:	3d64                	fld	fs1,248(a0)
    454a:	7830                	flw	fa2,112(s0)
    454c:	3025                	jal	3d74 <ee_printf+0x878>
    454e:	6c38                	flw	fa4,88(s0)
    4550:	2078                	fld	fa4,192(s0)
    4552:	6164                	flw	fs1,68(a0)
    4554:	6174                	flw	fa3,68(a0)
    4556:	303d                	jal	3d84 <__udivdi3>
    4558:	2578                	fld	fa4,200(a0)
    455a:	3830                	fld	fa2,112(s0)
    455c:	786c                	flw	fa1,116(s0)
    455e:	6420                	flw	fs0,72(s0)
    4560:	7461                	lui	s0,0xffff8
    4562:	5f61                	li	t5,-8
    4564:	6e65                	lui	t3,0x19
    4566:	3d64                	fld	fs1,248(a0)
    4568:	7830                	flw	fa2,112(s0)
    456a:	3025                	jal	3d92 <__udivdi3+0xe>
    456c:	6c38                	flw	fa4,88(s0)
    456e:	2078                	fld	fa4,192(s0)
    4570:	696c                	flw	fa1,84(a0)
    4572:	303d7473          	csrrci	s0,mideleg,26
    4576:	2578                	fld	fa4,200(a0)
    4578:	3830                	fld	fa2,112(s0)
    457a:	786c                	flw	fa1,116(s0)
    457c:	0a0d                	addi	s4,s4,3
    457e:	0000                	unimp
    4580:	5d4c435b          	0x5d4c435b
    4584:	4820                	lw	s0,80(s0)
    4586:	4145                	li	sp,17
    4588:	5f44                	lw	s1,60(a4)
    458a:	4e49                	li	t3,18
    458c:	5449                	li	s0,-14
    458e:	425f 4745 4e49      	0x4e494745425f
    4594:	0a0d                	addi	s4,s4,3
    4596:	0000                	unimp
    4598:	5d4c435b          	0x5d4c435b
    459c:	4820                	lw	s0,80(s0)
    459e:	4145                	li	sp,17
    45a0:	5f44                	lw	s1,60(a4)
    45a2:	454e                	lw	a0,208(sp)
    45a4:	5458                	lw	a4,44(s0)
    45a6:	445f 4e4f 0d45      	0xd454e4f445f
    45ac:	000a                	c.slli	zero,0x2
    45ae:	0000                	unimp
    45b0:	5d4c435b          	0x5d4c435b
    45b4:	4820                	lw	s0,80(s0)
    45b6:	4145                	li	sp,17
    45b8:	5f44                	lw	s1,60(a4)
    45ba:	4e49                	li	t3,18
    45bc:	4f46                	lw	t5,80(sp)
    45be:	445f 4e4f 2045      	0x20454e4f445f
    45c4:	6e69                	lui	t3,0x1a
    45c6:	6f66                	flw	ft10,88(sp)
    45c8:	303d                	jal	3df6 <__udivdi3+0x72>
    45ca:	2578                	fld	fa4,200(a0)
    45cc:	3830                	fld	fa2,112(s0)
    45ce:	786c                	flw	fa1,116(s0)
    45d0:	0a0d                	addi	s4,s4,3
    45d2:	0000                	unimp
    45d4:	5d4c435b          	0x5d4c435b
    45d8:	4820                	lw	s0,80(s0)
    45da:	4145                	li	sp,17
    45dc:	5f44                	lw	s1,60(a4)
    45de:	4449                	li	s0,18
    45e0:	5f58                	lw	a4,60(a4)
    45e2:	4f44                	lw	s1,28(a4)
    45e4:	454e                	lw	a0,208(sp)
    45e6:	0a0d                	addi	s4,s4,3
    45e8:	0000                	unimp
    45ea:	0000                	unimp
    45ec:	5d4c435b          	0x5d4c435b
    45f0:	4820                	lw	s0,80(s0)
    45f2:	4145                	li	sp,17
    45f4:	5f44                	lw	s1,60(a4)
    45f6:	4144                	lw	s1,4(a0)
    45f8:	4154                	lw	a3,4(a0)
    45fa:	445f 4e4f 0d45      	0xd454e4f445f
    4600:	000a                	c.slli	zero,0x2
    4602:	0000                	unimp
    4604:	5d4c435b          	0x5d4c435b
    4608:	5420                	lw	s0,104(s0)
    460a:	4941                	li	s2,16
    460c:	5f4c                	lw	a1,60(a4)
    460e:	4e49                	li	t3,18
    4610:	54524553          	0x54524553
    4614:	425f 4745 4e49      	0x4e494745425f
    461a:	6d20                	flw	fs0,88(a0)
    461c:	6d65                	lui	s10,0x19
    461e:	303d                	jal	3e4c <__udivdi3+0xc8>
    4620:	2578                	fld	fa4,200(a0)
    4622:	3830                	fld	fa2,112(s0)
    4624:	786c                	flw	fa1,116(s0)
    4626:	6420                	flw	fs0,72(s0)
    4628:	7461                	lui	s0,0xffff8
    462a:	3d61                	jal	44c2 <__udivdi3+0x73e>
    462c:	7830                	flw	fa2,112(s0)
    462e:	3025                	jal	3e56 <__udivdi3+0xd2>
    4630:	6c38                	flw	fa4,88(s0)
    4632:	0d78                	addi	a4,sp,668
    4634:	000a                	c.slli	zero,0x2
    4636:	0000                	unimp
    4638:	5d4c435b          	0x5d4c435b
    463c:	5420                	lw	s0,104(s0)
    463e:	4941                	li	s2,16
    4640:	5f4c                	lw	a1,60(a4)
    4642:	4e49                	li	t3,18
    4644:	54524553          	0x54524553
    4648:	445f 4e4f 2045      	0x20454e4f445f
    464e:	6572                	flw	fa0,28(sp)
    4650:	3d74                	fld	fa3,248(a0)
    4652:	7830                	flw	fa2,112(s0)
    4654:	3025                	jal	3e7c <__udivdi3+0xf8>
    4656:	6c38                	flw	fa4,88(s0)
    4658:	2078                	fld	fa4,192(s0)
    465a:	656d                	lui	a0,0x1b
    465c:	3d6d                	jal	4516 <__udivdi3+0x792>
    465e:	7830                	flw	fa2,112(s0)
    4660:	3025                	jal	3e88 <__udivdi3+0x104>
    4662:	6c38                	flw	fa4,88(s0)
    4664:	2078                	fld	fa4,192(s0)
    4666:	6164                	flw	fs1,68(a0)
    4668:	6174                	flw	fa3,68(a0)
    466a:	303d                	jal	3e98 <__udivdi3+0x114>
    466c:	2578                	fld	fa4,200(a0)
    466e:	3830                	fld	fa2,112(s0)
    4670:	786c                	flw	fa1,116(s0)
    4672:	0a0d                	addi	s4,s4,3
    4674:	0000                	unimp
    4676:	0000                	unimp
    4678:	5d4c435b          	0x5d4c435b
    467c:	4220                	lw	s0,64(a2)
    467e:	4c55                	li	s8,21
    4680:	4e495f4b          	fnmsub.q	ft10,fs2,ft4,fs1,unknown
    4684:	54524553          	0x54524553
    4688:	425f 4745 4e49      	0x4e494745425f
    468e:	7320                	flw	fs0,96(a4)
    4690:	7a69                	lui	s4,0xffffa
    4692:	3d65                	jal	454a <__udivdi3+0x7c6>
    4694:	6c25                	lui	s8,0x9
    4696:	0d75                	addi	s10,s10,29
    4698:	000a                	c.slli	zero,0x2
    469a:	0000                	unimp
    469c:	5d4c435b          	0x5d4c435b
    46a0:	4220                	lw	s0,64(a2)
    46a2:	4c55                	li	s8,21
    46a4:	4e495f4b          	fnmsub.q	ft10,fs2,ft4,fs1,unknown
    46a8:	54524553          	0x54524553
    46ac:	535f 4554 5f50      	0x5f504554535f
    46b2:	4f44                	lw	s1,28(a4)
    46b4:	454e                	lw	a0,208(sp)
    46b6:	6920                	flw	fs0,80(a0)
    46b8:	253d                	jal	4ce6 <list_known_crc+0x132>
    46ba:	756c                	flw	fa1,108(a0)
    46bc:	7220                	flw	fs0,96(a2)
    46be:	7465                	lui	s0,0xffff9
    46c0:	303d                	jal	3eee <__udivdi3+0x16a>
    46c2:	2578                	fld	fa4,200(a0)
    46c4:	3830                	fld	fa2,112(s0)
    46c6:	786c                	flw	fa1,116(s0)
    46c8:	0a0d                	addi	s4,s4,3
    46ca:	0000                	unimp
    46cc:	5d4c435b          	0x5d4c435b
    46d0:	4220                	lw	s0,64(a2)
    46d2:	4c55                	li	s8,21
    46d4:	4e495f4b          	fnmsub.q	ft10,fs2,ft4,fs1,unknown
    46d8:	54524553          	0x54524553
    46dc:	4e5f 4c55 204c      	0x204c4c554e5f
    46e2:	3d69                	jal	457c <__udivdi3+0x7f8>
    46e4:	6c25                	lui	s8,0x9
    46e6:	0d75                	addi	s10,s10,29
    46e8:	000a                	c.slli	zero,0x2
    46ea:	0000                	unimp
    46ec:	5d4c435b          	0x5d4c435b
    46f0:	4220                	lw	s0,64(a2)
    46f2:	4c55                	li	s8,21
    46f4:	4e495f4b          	fnmsub.q	ft10,fs2,ft4,fs1,unknown
    46f8:	54524553          	0x54524553
    46fc:	445f 4e4f 2045      	0x20454e4f445f
    4702:	3d69                	jal	459c <__udivdi3+0x818>
    4704:	6c25                	lui	s8,0x9
    4706:	2075                	jal	47b2 <__udivdi3+0xa2e>
    4708:	656d                	lui	a0,0x1b
    470a:	3d6d                	jal	45c4 <__udivdi3+0x840>
    470c:	7830                	flw	fa2,112(s0)
    470e:	3025                	jal	3f36 <__udivdi3+0x1b2>
    4710:	6c38                	flw	fa4,88(s0)
    4712:	2078                	fld	fa4,192(s0)
    4714:	6164                	flw	fs1,68(a0)
    4716:	6174                	flw	fa3,68(a0)
    4718:	303d                	jal	3f46 <__udivdi3+0x1c2>
    471a:	2578                	fld	fa4,200(a0)
    471c:	3830                	fld	fa2,112(s0)
    471e:	786c                	flw	fa1,116(s0)
    4720:	0a0d                	addi	s4,s4,3
    4722:	0000                	unimp
    4724:	5d4c435b          	0x5d4c435b
    4728:	4920                	lw	s0,80(a0)
    472a:	444e                	lw	s0,208(sp)
    472c:	5845                	li	a6,-15
    472e:	425f 4745 4e49      	0x4e494745425f
    4734:	6620                	flw	fs0,72(a2)
    4736:	6e69                	lui	t3,0x1a
    4738:	6564                	flw	fs1,76(a0)
    473a:	3d72                	fld	fs10,312(sp)
    473c:	7830                	flw	fa2,112(s0)
    473e:	3025                	jal	3f66 <__udivdi3+0x1e2>
    4740:	6c38                	flw	fa4,88(s0)
    4742:	0d78                	addi	a4,sp,668
    4744:	000a                	c.slli	zero,0x2
    4746:	0000                	unimp
    4748:	5d4c435b          	0x5d4c435b
    474c:	4920                	lw	s0,80(a0)
    474e:	444e                	lw	s0,208(sp)
    4750:	5845                	li	a6,-15
    4752:	535f 4554 5f50      	0x5f504554535f
    4758:	4542                	lw	a0,16(sp)
    475a:	204e4947          	fmsub.s	fs2,ft8,ft4,ft4,rmm
    475e:	70657473          	csrrci	s0,0x706,10
    4762:	253d                	jal	4d90 <list_known_crc+0x1dc>
    4764:	756c                	flw	fa1,108(a0)
    4766:	6620                	flw	fs0,72(a2)
    4768:	6e69                	lui	t3,0x1a
    476a:	6564                	flw	fs1,76(a0)
    476c:	3d72                	fld	fs10,312(sp)
    476e:	7830                	flw	fa2,112(s0)
    4770:	3025                	jal	3f98 <__udivdi3+0x214>
    4772:	6c38                	flw	fa4,88(s0)
    4774:	2078                	fld	fa4,192(s0)
    4776:	656e                	flw	fa0,216(sp)
    4778:	7478                	flw	fa4,108(s0)
    477a:	303d                	jal	3fa8 <__udivdi3+0x224>
    477c:	2578                	fld	fa4,200(a0)
    477e:	3830                	fld	fa2,112(s0)
    4780:	786c                	flw	fa1,116(s0)
    4782:	6920                	flw	fs0,80(a0)
    4784:	253d                	jal	4db2 <list_known_crc+0x1fe>
    4786:	756c                	flw	fa1,108(a0)
    4788:	0a0d                	addi	s4,s4,3
    478a:	0000                	unimp
    478c:	5d4c435b          	0x5d4c435b
    4790:	4920                	lw	s0,80(a0)
    4792:	444e                	lw	s0,208(sp)
    4794:	5845                	li	a6,-15
    4796:	535f 4554 5f50      	0x5f504554535f
    479c:	4f44                	lw	s1,28(a4)
    479e:	454e                	lw	a0,208(sp)
    47a0:	7320                	flw	fs0,96(a4)
    47a2:	6574                	flw	fa3,76(a0)
    47a4:	3d70                	fld	fa2,248(a0)
    47a6:	6c25                	lui	s8,0x9
    47a8:	2075                	jal	4854 <__udivdi3+0xad0>
    47aa:	6469                	lui	s0,0x1a
    47ac:	3d78                	fld	fa4,248(a0)
    47ae:	7830                	flw	fa2,112(s0)
    47b0:	3025                	jal	3fd8 <__udivdi3+0x254>
    47b2:	7834                	flw	fa3,112(s0)
    47b4:	0a0d                	addi	s4,s4,3
    47b6:	0000                	unimp
    47b8:	5d4c435b          	0x5d4c435b
    47bc:	4520                	lw	s0,72(a0)
    47be:	5252                	lw	tp,52(sp)
    47c0:	495f524f          	fnmadd.s	ft4,ft10,fs5,fs1,unknown
    47c4:	444e                	lw	s0,208(sp)
    47c6:	5845                	li	a6,-15
    47c8:	4c5f 4f4f 5f50      	0x5f504f4f4c5f
    47ce:	494c                	lw	a1,20(a0)
    47d0:	494d                	li	s2,19
    47d2:	2054                	fld	fa3,128(s0)
    47d4:	70657473          	csrrci	s0,0x706,10
    47d8:	253d                	jal	4e06 <list_known_crc+0x252>
    47da:	756c                	flw	fa1,108(a0)
    47dc:	7320                	flw	fs0,96(a4)
    47de:	7a69                	lui	s4,0xffffa
    47e0:	3d65                	jal	4698 <__udivdi3+0x914>
    47e2:	6c25                	lui	s8,0x9
    47e4:	0d75                	addi	s10,s10,29
    47e6:	000a                	c.slli	zero,0x2
    47e8:	5d4c435b          	0x5d4c435b
    47ec:	4920                	lw	s0,80(a0)
    47ee:	444e                	lw	s0,208(sp)
    47f0:	5845                	li	a6,-15
    47f2:	445f 4e4f 2045      	0x20454e4f445f
    47f8:	70657473          	csrrci	s0,0x706,10
    47fc:	6c253d73          	csrrc	s10,0x6c2,a0
    4800:	2075                	jal	48ac <__udivdi3+0xb28>
    4802:	6966                	flw	fs2,88(sp)
    4804:	646e                	flw	fs0,216(sp)
    4806:	7265                	lui	tp,0xffff9
    4808:	303d                	jal	4036 <__udivdi3+0x2b2>
    480a:	2578                	fld	fa4,200(a0)
    480c:	3830                	fld	fa2,112(s0)
    480e:	786c                	flw	fa1,116(s0)
    4810:	0a0d                	addi	s4,s4,3
    4812:	0000                	unimp
    4814:	5d4c435b          	0x5d4c435b
    4818:	5320                	lw	s0,96(a4)
    481a:	5f54524f          	fnmadd.q	ft4,fs0,fs5,fa1,unknown
    481e:	4542                	lw	a0,16(sp)
    4820:	204e4947          	fmsub.s	fs2,ft8,ft4,ft4,rmm
    4824:	696c                	flw	fa1,84(a0)
    4826:	303d7473          	csrrci	s0,mideleg,26
    482a:	2578                	fld	fa4,200(a0)
    482c:	3830                	fld	fa2,112(s0)
    482e:	786c                	flw	fa1,116(s0)
    4830:	0a0d                	addi	s4,s4,3
    4832:	0000                	unimp
    4834:	5d4c435b          	0x5d4c435b
    4838:	5320                	lw	s0,96(a4)
    483a:	5f54524f          	fnmadd.q	ft4,fs0,fs5,fa1,unknown
    483e:	4f44                	lw	s1,28(a4)
    4840:	454e                	lw	a0,208(sp)
    4842:	6c20                	flw	fs0,88(s0)
    4844:	7369                	lui	t1,0xffffa
    4846:	3d74                	fld	fa3,248(a0)
    4848:	7830                	flw	fa2,112(s0)
    484a:	3025                	jal	4072 <__udivdi3+0x2ee>
    484c:	6c38                	flw	fa4,88(s0)
    484e:	0d78                	addi	a4,sp,668
    4850:	000a                	c.slli	zero,0x2
    4852:	0000                	unimp
    4854:	5d4c435b          	0x5d4c435b
    4858:	4220                	lw	s0,64(a2)
    485a:	4c55                	li	s8,21
    485c:	4e495f4b          	fnmsub.q	ft10,fs2,ft4,fs1,unknown
    4860:	54524553          	0x54524553
    4864:	535f 4554 5f50      	0x5f504554535f
    486a:	4542                	lw	a0,16(sp)
    486c:	204e4947          	fmsub.s	fs2,ft8,ft4,ft4,rmm
    4870:	3d69                	jal	470a <__udivdi3+0x986>
    4872:	6c25                	lui	s8,0x9
    4874:	2075                	jal	4920 <__udivdi3+0xb9c>
    4876:	6164                	flw	fs1,68(a0)
    4878:	3d74                	fld	fa3,248(a0)
    487a:	7830                	flw	fa2,112(s0)
    487c:	3025                	jal	40a4 <__udivdi3+0x320>
    487e:	7834                	flw	fa3,112(s0)
    4880:	6d20                	flw	fs0,88(a0)
    4882:	6d65                	lui	s10,0x19
    4884:	303d                	jal	40b2 <__udivdi3+0x32e>
    4886:	2578                	fld	fa4,200(a0)
    4888:	3830                	fld	fa2,112(s0)
    488a:	786c                	flw	fa1,116(s0)
    488c:	6420                	flw	fs0,72(s0)
    488e:	7461                	lui	s0,0xffff8
    4890:	3d61                	jal	4728 <__udivdi3+0x9a4>
    4892:	7830                	flw	fa2,112(s0)
    4894:	3025                	jal	40bc <__udivdi3+0x338>
    4896:	6c38                	flw	fa4,88(s0)
    4898:	0d78                	addi	a4,sp,668
    489a:	000a                	c.slli	zero,0x2
    489c:	5d4c435b          	0x5d4c435b
    48a0:	4920                	lw	s0,80(a0)
    48a2:	534e                	lw	t1,240(sp)
    48a4:	5245                	li	tp,-15
    48a6:	5f54                	lw	a3,60(a4)
    48a8:	4e45                	li	t3,17
    48aa:	4554                	lw	a3,12(a0)
    48ac:	2052                	fld	ft0,272(sp)
    48ae:	6f70                	flw	fa2,92(a4)
    48b0:	6e69                	lui	t3,0x1a
    48b2:	3d74                	fld	fa3,248(a0)
    48b4:	7830                	flw	fa2,112(s0)
    48b6:	3025                	jal	40de <__udivdi3+0x35a>
    48b8:	6c38                	flw	fa4,88(s0)
    48ba:	2078                	fld	fa4,192(s0)
    48bc:	656d                	lui	a0,0x1b
    48be:	3d6d                	jal	4778 <__udivdi3+0x9f4>
    48c0:	7830                	flw	fa2,112(s0)
    48c2:	3025                	jal	40ea <__udivdi3+0x366>
    48c4:	6c38                	flw	fa4,88(s0)
    48c6:	2078                	fld	fa4,192(s0)
    48c8:	6164                	flw	fs1,68(a0)
    48ca:	6174                	flw	fa3,68(a0)
    48cc:	303d                	jal	40fa <__udivdi3+0x376>
    48ce:	2578                	fld	fa4,200(a0)
    48d0:	3830                	fld	fa2,112(s0)
    48d2:	786c                	flw	fa1,116(s0)
    48d4:	6d20                	flw	fs0,88(a0)
    48d6:	6d65                	lui	s10,0x19
    48d8:	655f 646e 303d      	0x303d646e655f
    48de:	2578                	fld	fa4,200(a0)
    48e0:	3830                	fld	fa2,112(s0)
    48e2:	786c                	flw	fa1,116(s0)
    48e4:	6420                	flw	fs0,72(s0)
    48e6:	7461                	lui	s0,0xffff8
    48e8:	5f61                	li	t5,-8
    48ea:	6e65                	lui	t3,0x19
    48ec:	3d64                	fld	fs1,248(a0)
    48ee:	7830                	flw	fa2,112(s0)
    48f0:	3025                	jal	4118 <__udivdi3+0x394>
    48f2:	6c38                	flw	fa4,88(s0)
    48f4:	0d78                	addi	a4,sp,668
    48f6:	000a                	c.slli	zero,0x2
    48f8:	5d4c435b          	0x5d4c435b
    48fc:	4920                	lw	s0,80(a0)
    48fe:	534e                	lw	t1,240(sp)
    4900:	5245                	li	tp,-15
    4902:	5f54                	lw	a3,60(a4)
    4904:	454d                	li	a0,19
    4906:	5f4d                	li	t5,-13
    4908:	5546                	lw	a0,112(sp)
    490a:	4c4c                	lw	a1,28(s0)
    490c:	0a0d                	addi	s4,s4,3
    490e:	0000                	unimp
    4910:	5d4c435b          	0x5d4c435b
    4914:	4920                	lw	s0,80(a0)
    4916:	534e                	lw	t1,240(sp)
    4918:	5245                	li	tp,-15
    491a:	5f54                	lw	a3,60(a4)
    491c:	4144                	lw	s1,4(a0)
    491e:	4154                	lw	a3,4(a0)
    4920:	465f 4c55 0d4c      	0xd4c4c55465f
    4926:	000a                	c.slli	zero,0x2
    4928:	5d4c435b          	0x5d4c435b
    492c:	4920                	lw	s0,80(a0)
    492e:	534e                	lw	t1,240(sp)
    4930:	5245                	li	tp,-15
    4932:	5f54                	lw	a3,60(a4)
    4934:	4f44                	lw	s1,28(a4)
    4936:	454e                	lw	a0,208(sp)
    4938:	6e20                	flw	fs0,88(a2)
    493a:	7765                	lui	a4,0xffff9
    493c:	303d                	jal	416a <__udivdi3+0x3e6>
    493e:	2578                	fld	fa4,200(a0)
    4940:	3830                	fld	fa2,112(s0)
    4942:	786c                	flw	fa1,116(s0)
    4944:	6e20                	flw	fs0,88(a2)
    4946:	7865                	lui	a6,0xffff9
    4948:	3d74                	fld	fa3,248(a0)
    494a:	7830                	flw	fa2,112(s0)
    494c:	3025                	jal	4174 <__udivdi3+0x3f0>
    494e:	6c38                	flw	fa4,88(s0)
    4950:	2078                	fld	fa4,192(s0)
    4952:	6e69                	lui	t3,0x1a
    4954:	6f66                	flw	ft10,88(sp)
    4956:	303d                	jal	4184 <__udivdi3+0x400>
    4958:	2578                	fld	fa4,200(a0)
    495a:	3830                	fld	fa2,112(s0)
    495c:	786c                	flw	fa1,116(s0)
    495e:	6420                	flw	fs0,72(s0)
    4960:	7461                	lui	s0,0xffff8
    4962:	3161                	jal	45ea <__udivdi3+0x866>
    4964:	3d36                	fld	fs10,360(sp)
    4966:	7830                	flw	fa2,112(s0)
    4968:	3025                	jal	4190 <__udivdi3+0x40c>
    496a:	7834                	flw	fa3,112(s0)
    496c:	6920                	flw	fs0,80(a0)
    496e:	7864                	flw	fs1,116(s0)
    4970:	303d                	jal	419e <__udivdi3+0x41a>
    4972:	2578                	fld	fa4,200(a0)
    4974:	3430                	fld	fa2,104(s0)
    4976:	0d78                	addi	a4,sp,668
    4978:	000a                	c.slli	zero,0x2
    497a:	0000                	unimp
    497c:	5d4c435b          	0x5d4c435b
    4980:	4d20                	lw	s0,88(a0)
    4982:	5245                	li	tp,-15
    4984:	4f534547          	fmsub.q	fa0,ft6,fs5,fs1,rmm
    4988:	5452                	lw	s0,52(sp)
    498a:	455f 544e 5245      	0x5245544e455f
    4990:	6c20                	flw	fs0,88(s0)
    4992:	7369                	lui	t1,0xffffa
    4994:	3d74                	fld	fa3,248(a0)
    4996:	7830                	flw	fa2,112(s0)
    4998:	3025                	jal	41c0 <__udivdi3+0x43c>
    499a:	6c38                	flw	fa4,88(s0)
    499c:	0d78                	addi	a4,sp,668
    499e:	000a                	c.slli	zero,0x2
    49a0:	5d4c435b          	0x5d4c435b
    49a4:	4d20                	lw	s0,88(a0)
    49a6:	5245                	li	tp,-15
    49a8:	4f534547          	fmsub.q	fa0,ft6,fs5,fs1,rmm
    49ac:	5452                	lw	s0,52(sp)
    49ae:	505f 5341 5f53      	0x5f535341505f
    49b4:	4542                	lw	a0,16(sp)
    49b6:	204e4947          	fmsub.s	fs2,ft8,ft4,ft4,rmm
    49ba:	6e69                	lui	t3,0x1a
    49bc:	657a6973          	csrrsi	s2,0x657,20
    49c0:	253d                	jal	4fee <list_known_crc+0x43a>
    49c2:	646c                	flw	fa1,76(s0)
    49c4:	7020                	flw	fs0,96(s0)
    49c6:	303d                	jal	41f4 <__udivdi3+0x470>
    49c8:	2578                	fld	fa4,200(a0)
    49ca:	3830                	fld	fa2,112(s0)
    49cc:	786c                	flw	fa1,116(s0)
    49ce:	0a0d                	addi	s4,s4,3
    49d0:	0000                	unimp
    49d2:	0000                	unimp
    49d4:	5d4c435b          	0x5d4c435b
    49d8:	4d20                	lw	s0,88(a0)
    49da:	5245                	li	tp,-15
    49dc:	435f4547          	fmsub.d	fa0,ft10,fs5,fs0,rmm
    49e0:	504d                	c.li	zero,-13
    49e2:	425f 4745 4e49      	0x4e494745425f
    49e8:	6e20                	flw	fs0,88(a2)
    49ea:	253d                	jal	5018 <list_known_crc+0x464>
    49ec:	756c                	flw	fa1,108(a0)
    49ee:	7020                	flw	fs0,96(s0)
    49f0:	303d                	jal	421e <__udivdi3+0x49a>
    49f2:	2578                	fld	fa4,200(a0)
    49f4:	3830                	fld	fa2,112(s0)
    49f6:	786c                	flw	fa1,116(s0)
    49f8:	7120                	flw	fs0,96(a0)
    49fa:	303d                	jal	4228 <__udivdi3+0x4a4>
    49fc:	2578                	fld	fa4,200(a0)
    49fe:	3830                	fld	fa2,112(s0)
    4a00:	786c                	flw	fa1,116(s0)
    4a02:	7020                	flw	fs0,96(s0)
    4a04:	6e69                	lui	t3,0x1a
    4a06:	6f66                	flw	ft10,88(sp)
    4a08:	303d                	jal	4236 <__udivdi3+0x4b2>
    4a0a:	2578                	fld	fa4,200(a0)
    4a0c:	3830                	fld	fa2,112(s0)
    4a0e:	786c                	flw	fa1,116(s0)
    4a10:	7120                	flw	fs0,96(a0)
    4a12:	6e69                	lui	t3,0x1a
    4a14:	6f66                	flw	ft10,88(sp)
    4a16:	303d                	jal	4244 <__udivdi3+0x4c0>
    4a18:	2578                	fld	fa4,200(a0)
    4a1a:	3830                	fld	fa2,112(s0)
    4a1c:	786c                	flw	fa1,116(s0)
    4a1e:	7020                	flw	fs0,96(s0)
    4a20:	657a6973          	csrrsi	s2,0x657,20
    4a24:	253d                	jal	5052 <list_known_crc+0x49e>
    4a26:	646c                	flw	fa1,76(s0)
    4a28:	7120                	flw	fs0,96(a0)
    4a2a:	657a6973          	csrrsi	s2,0x657,20
    4a2e:	253d                	jal	505c <list_known_crc+0x4a8>
    4a30:	646c                	flw	fa1,76(s0)
    4a32:	0a0d                	addi	s4,s4,3
    4a34:	0000                	unimp
    4a36:	0000                	unimp
    4a38:	5d4c435b          	0x5d4c435b
    4a3c:	4d20                	lw	s0,88(a0)
    4a3e:	5245                	li	tp,-15
    4a40:	435f4547          	fmsub.d	fa0,ft10,fs5,fs0,rmm
    4a44:	504d                	c.li	zero,-13
    4a46:	445f 4e4f 2045      	0x20454e4f445f
    4a4c:	6572                	flw	fa0,28(sp)
    4a4e:	746c7573          	csrrci	a0,0x746,24
    4a52:	253d                	jal	5080 <list_known_crc+0x4cc>
    4a54:	646c                	flw	fa1,76(s0)
    4a56:	0a0d                	addi	s4,s4,3
    4a58:	0000                	unimp
    4a5a:	0000                	unimp
    4a5c:	5d4c435b          	0x5d4c435b
    4a60:	4d20                	lw	s0,88(a0)
    4a62:	5245                	li	tp,-15
    4a64:	4f534547          	fmsub.q	fa0,ft6,fs5,fs1,rmm
    4a68:	5452                	lw	s0,52(sp)
    4a6a:	505f 5341 5f53      	0x5f535341505f
    4a70:	4f44                	lw	s1,28(a4)
    4a72:	454e                	lw	a0,208(sp)
    4a74:	6920                	flw	fs0,80(a0)
    4a76:	736e                	flw	ft6,248(sp)
    4a78:	7a69                	lui	s4,0xffffa
    4a7a:	3d65                	jal	4932 <__udivdi3+0xbae>
    4a7c:	6c25                	lui	s8,0x9
    4a7e:	2064                	fld	fs1,192(s0)
    4a80:	6d6e                	flw	fs10,216(sp)
    4a82:	7265                	lui	tp,0xffff9
    4a84:	3d736567          	0x3d736567
    4a88:	6c25                	lui	s8,0x9
    4a8a:	2064                	fld	fs1,192(s0)
    4a8c:	696c                	flw	fa1,84(a0)
    4a8e:	303d7473          	csrrci	s0,mideleg,26
    4a92:	2578                	fld	fa4,200(a0)
    4a94:	3830                	fld	fa2,112(s0)
    4a96:	786c                	flw	fa1,116(s0)
    4a98:	0a0d                	addi	s4,s4,3
    4a9a:	0000                	unimp
    4a9c:	5d4c435b          	0x5d4c435b
    4aa0:	4d20                	lw	s0,88(a0)
    4aa2:	5245                	li	tp,-15
    4aa4:	4f534547          	fmsub.q	fa0,ft6,fs5,fs1,rmm
    4aa8:	5452                	lw	s0,52(sp)
    4aaa:	445f 4e4f 2045      	0x20454e4f445f
    4ab0:	696c                	flw	fa1,84(a0)
    4ab2:	303d7473          	csrrci	s0,mideleg,26
    4ab6:	2578                	fld	fa4,200(a0)
    4ab8:	3830                	fld	fa2,112(s0)
    4aba:	786c                	flw	fa1,116(s0)
    4abc:	0a0d                	addi	s4,s4,3
    4abe:	0000                	unimp
    4ac0:	5d4d435b          	0x5d4d435b
    4ac4:	4920                	lw	s0,80(a0)
    4ac6:	4554                	lw	a3,12(a0)
    4ac8:	4152                	lw	sp,20(sp)
    4aca:	4554                	lw	a3,12(a0)
    4acc:	425f 4745 4e49      	0x4e494745425f
    4ad2:	6920                	flw	fs0,80(a0)
    4ad4:	6574                	flw	fa3,76(a0)
    4ad6:	6172                	flw	ft2,28(sp)
    4ad8:	6974                	flw	fa3,84(a0)
    4ada:	3d736e6f          	jal	t3,3b6b0 <__stack_top+0x2b6b0>
    4ade:	6c25                	lui	s8,0x9
    4ae0:	0d75                	addi	s10,s10,29
    4ae2:	000a                	c.slli	zero,0x2
    4ae4:	5d4d435b          	0x5d4d435b
    4ae8:	4920                	lw	s0,80(a0)
    4aea:	4554                	lw	a3,12(a0)
    4aec:	4152                	lw	sp,20(sp)
    4aee:	4554                	lw	a3,12(a0)
    4af0:	445f 4e4f 2045      	0x20454e4f445f
    4af6:	3d637263          	bgeu	t1,s6,4eba <list_known_crc+0x306>
    4afa:	7830                	flw	fa2,112(s0)
    4afc:	3025                	jal	4324 <__udivdi3+0x5a0>
    4afe:	7834                	flw	fa3,112(s0)
    4b00:	0a0d                	addi	s4,s4,3
    4b02:	0000                	unimp
    4b04:	5d4d435b          	0x5d4d435b
    4b08:	4920                	lw	s0,80(a0)
    4b0a:	4554                	lw	a3,12(a0)
    4b0c:	3052                	fld	ft0,304(sp)
    4b0e:	4c5f 5349 5f54      	0x5f5453494c5f
    4b14:	4f50                	lw	a2,28(a4)
    4b16:	45425f53          	0x45425f53
    4b1a:	0d4e4947          	0xd4e4947
    4b1e:	000a                	c.slli	zero,0x2
    4b20:	5d4d435b          	0x5d4d435b
    4b24:	4920                	lw	s0,80(a0)
    4b26:	4554                	lw	a3,12(a0)
    4b28:	3052                	fld	ft0,304(sp)
    4b2a:	4c5f 5349 5f54      	0x5f5453494c5f
    4b30:	4f50                	lw	a2,28(a4)
    4b32:	4f445f53          	0x4f445f53
    4b36:	454e                	lw	a0,208(sp)
    4b38:	6320                	flw	fs0,64(a4)
    4b3a:	6372                	flw	ft6,28(sp)
    4b3c:	303d                	jal	436a <__udivdi3+0x5e6>
    4b3e:	2578                	fld	fa4,200(a0)
    4b40:	3430                	fld	fa2,104(s0)
    4b42:	0d78                	addi	a4,sp,668
    4b44:	000a                	c.slli	zero,0x2
    4b46:	0000                	unimp
    4b48:	5d4d435b          	0x5d4d435b
    4b4c:	4920                	lw	s0,80(a0)
    4b4e:	4554                	lw	a3,12(a0)
    4b50:	3052                	fld	ft0,304(sp)
    4b52:	4c5f 5349 5f54      	0x5f5453494c5f
    4b58:	454e                	lw	a0,208(sp)
    4b5a:	45425f47          	0x45425f47
    4b5e:	0d4e4947          	0xd4e4947
    4b62:	000a                	c.slli	zero,0x2
    4b64:	5d4d435b          	0x5d4d435b
    4b68:	4920                	lw	s0,80(a0)
    4b6a:	4554                	lw	a3,12(a0)
    4b6c:	3052                	fld	ft0,304(sp)
    4b6e:	4c5f 5349 5f54      	0x5f5453494c5f
    4b74:	454e                	lw	a0,208(sp)
    4b76:	4f445f47          	fmsub.q	ft10,fs0,fs4,fs1,unknown
    4b7a:	454e                	lw	a0,208(sp)
    4b7c:	6320                	flw	fs0,64(a4)
    4b7e:	6372                	flw	ft6,28(sp)
    4b80:	303d                	jal	43ae <__udivdi3+0x62a>
    4b82:	2578                	fld	fa4,200(a0)
    4b84:	3430                	fld	fa2,104(s0)
    4b86:	0d78                	addi	a4,sp,668
    4b88:	000a                	c.slli	zero,0x2
    4b8a:	0000                	unimp
    4b8c:	5d4d435b          	0x5d4d435b
    4b90:	4920                	lw	s0,80(a0)
    4b92:	4554                	lw	a3,12(a0)
    4b94:	5f52                	lw	t5,52(sp)
    4b96:	5250                	lw	a2,36(a2)
    4b98:	4552474f          	0x4552474f
    4b9c:	25205353          	0x25205353
    4ba0:	756c                	flw	fa1,108(a0)
    4ba2:	756c252f          	0x756c252f
    4ba6:	6320                	flw	fs0,64(a4)
    4ba8:	6372                	flw	ft6,28(sp)
    4baa:	303d                	jal	43d8 <__udivdi3+0x654>
    4bac:	2578                	fld	fa4,200(a0)
    4bae:	3430                	fld	fa2,104(s0)
    4bb0:	0d78                	addi	a4,sp,668
    4bb2:	000a                	c.slli	zero,0x2

00004bb4 <list_known_crc>:
    4bb4:	d4b0 3340 6a79 e714 e3c1 0000 435b 5d4d     ..@3yj......[CM]
    4bc4:	4d20 4941 5f4e 4641 4554 5f52 4f50 5452      MAIN_AFTER_PORT
    4bd4:	4241 454c 495f 494e 0d54 000a 435b 5d4d     ABLE_INIT...[CM]
    4be4:	5320 4545 5344 7320 6565 3164 303d 2578      SEEDS seed1=0x%
    4bf4:	3430 2078 6573 6465 3d32 7830 3025 7834     04x seed2=0x%04x
    4c04:	7320 6565 3364 303d 2578 3430 2078 7469      seed3=0x%04x it
    4c14:	7265 7461 6f69 736e 253d 756c 6520 6578     erations=%lu exe
    4c24:	7363 303d 2578 3830 786c 0a0d 0000 0000     cs=0x%08lx......
    4c34:	435b 5d4d 4520 4558 5343 5a5f 5245 5f4f     [CM] EXECS_ZERO_
    4c44:	5355 5f45 4c41 204c 616d 6b73 303d 2578     USE_ALL mask=0x%
    4c54:	3830 786c 0a0d 0000 435b 5d4d 4520 4558     08lx....[CM] EXE
    4c64:	5343 525f 4145 5944 6520 6578 7363 303d     CS_READY execs=0
    4c74:	2578 3830 786c 0a0d 0000 0000 435b 5d4d     x%08lx......[CM]
    4c84:	5320 4545 5344 525f 4145 5944 7320 6565      SEEDS_READY see
    4c94:	3164 303d 2578 3430 2078 6573 6465 3d32     d1=0x%04x seed2=
    4ca4:	7830 3025 7834 7320 6565 3364 303d 2578     0x%04x seed3=0x%
    4cb4:	3430 0d78 000a 0000 435b 5d4d 4d20 4d45     04x.....[CM] MEM
    4cc4:	535f 4154 4954 5f43 4542 4947 204e 7473     _STATIC_BEGIN st
    4cd4:	7461 6369 6d5f 6d65 6c62 3d6b 7830 3025     atic_memblk=0x%0
    4ce4:	6c38 2078 6f74 6174 3d6c 6c25 0d75 000a     8lx total=%lu...
    4cf4:	435b 5d4d 4d20 4d45 535f 4154 4954 5f43     [CM] MEM_STATIC_
    4d04:	4f44 454e 6d20 6d65 6c62 636f 306b 303d     DONE memblock0=0
    4d14:	2578 3830 786c 7320 7a69 3d65 6c25 2075     x%08lx size=%lu 
    4d24:	7265 3d72 6425 0a0d 0000 0000 435b 5d4d     err=%d......[CM]
    4d34:	4320 554f 544e 415f 474c 425f 4745 4e49      COUNT_ALG_BEGIN
    4d44:	6520 6578 7363 303d 2578 3830 786c 4e20      execs=0x%08lx N
    4d54:	4d55 415f 474c 524f 5449 4d48 3d53 7525     UM_ALGORITHMS=%u
    4d64:	0a0d 0000 435b 5d4d 4320 554f 544e 415f     ....[CM] COUNT_A
    4d74:	474c 535f 4554 2050 3d69 7525 6d20 7361     LG_STEP i=%u mas
    4d84:	3d6b 7830 3025 6c38 2078 6968 3d74 7525     k=0x%08lx hit=%u
    4d94:	6220 6665 726f 3d65 7525 0a0d 0000 0000      before=%u......
    4da4:	435b 5d4d 4320 554f 544e 415f 474c 445f     [CM] COUNT_ALG_D
    4db4:	4e4f 2045 756e 5f6d 6c61 6f67 6972 6874     ONE num_algorith
    4dc4:	736d 253d 0d75 000a 435b 5d4d 4520 5252     ms=%u...[CM] ERR
    4dd4:	524f 4e5f 4d55 415f 474c 524f 5449 4d48     OR_NUM_ALGORITHM
    4de4:	5f53 455a 4f52 6520 6578 7363 303d 2578     S_ZERO execs=0x%
    4df4:	3830 786c 0a0d 0000 435b 5d4d 4420 5649     08lx....[CM] DIV
    4e04:	535f 5a49 5f45 4542 4947 204e 6973 657a     _SIZE_BEGIN size
    4e14:	3d30 6c25 2075 756e 5f6d 6c61 6f67 6972     0=%lu num_algori
    4e24:	6874 736d 253d 2075 6f63 746e 7865 7374     thms=%u contexts
    4e34:	253d 0d75 000a 0000 435b 5d4d 4420 5649     =%u.....[CM] DIV
    4e44:	535f 5a49 5f45 5443 5f58 4542 4947 204e     _SIZE_CTX_BEGIN 
    4e54:	7463 3d78 7525 7320 7a69 5f65 6562 6f66     ctx=%u size_befo
    4e64:	6572 253d 756c 0a0d 0000 0000 435b 5d4d     re=%lu......[CM]
    4e74:	4420 5649 535f 5a49 5f45 5443 5f58 4f44      DIV_SIZE_CTX_DO
    4e84:	454e 6320 7874 253d 2075 6973 657a 615f     NE ctx=%u size_a
    4e94:	7466 7265 253d 756c 0a0d 0000 435b 5d4d     fter=%lu....[CM]
    4ea4:	4420 5441 5f41 5053 494c 2054 6c61 6f67      DATA_SPLIT algo
    4eb4:	6972 6874 736d 253d 2075 6570 5f72 6c61     rithms=%u per_al
    4ec4:	5f67 6973 657a 253d 756c 7420 746f 6c61     g_size=%lu total
    4ed4:	645f 7461 3d61 6c25 0d75 000a 435b 5d4d     _data=%lu...[CM]
    4ee4:	4120 5353 4749 5f4e 5450 5f52 4542 4947      ASSIGN_PTR_BEGI
    4ef4:	204e 6973 657a 253d 756c 0a0d 0000 0000     N size=%lu......
    4f04:	435b 5d4d 4120 5353 4749 5f4e 5450 5f52     [CM] ASSIGN_PTR_
    4f14:	4c41 2047 3d69 7525 6a20 253d 2075 616d     ALG i=%u j=%u ma
    4f24:	6b73 303d 2578 3830 786c 0a0d 0000 0000     sk=0x%08lx......
    4f34:	435b 5d4d 4120 5353 4749 5f4e 5450 2052     [CM] ASSIGN_PTR 
    4f44:	7463 3d78 6c25 2075 6c61 3d67 7525 6120     ctx=%lu alg=%u a
    4f54:	6464 3d72 7830 3025 6c38 0d78 000a 0000     ddr=0x%08lx.....
    4f64:	435b 5d4d 4120 5353 4749 5f4e 5450 5f52     [CM] ASSIGN_PTR_
    4f74:	4f44 454e 6a20 253d 0d75 000a 435b 5d4d     DONE j=%u...[CM]
    4f84:	4920 494e 5f54 494c 5453 425f 4745 4e49      INIT_LIST_BEGIN
    4f94:	6320 7874 253d 0d75 000a 0000 435b 5d4d      ctx=%u.....[CM]
    4fa4:	4920 494e 5f54 494c 5453 445f 4e4f 2045      INIT_LIST_DONE 
    4fb4:	7463 3d78 7525 0a0d 0000 0000 435b 5d4d     ctx=%u......[CM]
    4fc4:	4920 494e 5f54 414d 5254 5849 425f 4745      INIT_MATRIX_BEG
    4fd4:	4e49 6320 7874 253d 0d75 000a 435b 5d4d     IN ctx=%u...[CM]
    4fe4:	4920 494e 5f54 414d 5254 5849 445f 4e4f      INIT_MATRIX_DON
    4ff4:	2045 7463 3d78 7525 0a0d 0000 435b 5d4d     E ctx=%u....[CM]
    5004:	4920 494e 5f54 5453 5441 5f45 4542 4947      INIT_STATE_BEGI
    5014:	204e 7463 3d78 7525 0a0d 0000 435b 5d4d     N ctx=%u....[CM]
    5024:	4920 494e 5f54 5453 5441 5f45 4f44 454e      INIT_STATE_DONE
    5034:	6320 7874 253d 0d75 000a 0000 435b 5d4d      ctx=%u.....[CM]
    5044:	4420 5441 5f41 4e49 5449 445f 4e4f 0d45      DATA_INIT_DONE.
    5054:	000a 0000 435b 5d4d 4120 5455 5f4f 5449     ....[CM] AUTO_IT
    5064:	5245 425f 4745 4e49 0a0d 0000 435b 5d4d     ER_BEGIN....[CM]
    5074:	4120 5455 5f4f 5449 5245 545f 5952 6920      AUTO_ITER_TRY i
    5084:	6574 6172 6974 6e6f 3d73 6c25 0d75 000a     terations=%lu...
    5094:	435b 5d4d 4120 5455 5f4f 5449 5245 525f     [CM] AUTO_ITER_R
    50a4:	5345 4c55 2054 6974 6b63 3d73 6c25 2075     ESULT ticks=%lu 
    50b4:	6573 7363 253d 756c 0a0d 0000 435b 5d4d     secs=%lu....[CM]
    50c4:	4120 5455 5f4f 5449 5245 445f 4e4f 2045      AUTO_ITER_DONE 
    50d4:	6966 616e 5f6c 7469 7265 7461 6f69 736e     final_iterations
    50e4:	253d 756c 0a0d 0000 435b 5d4d 4620 5849     =%lu....[CM] FIX
    50f4:	4445 495f 4554 4152 4954 4e4f 2053 7469     ED_ITERATIONS it
    5104:	7265 7461 6f69 736e 253d 756c 0a0d 0000     erations=%lu....
    5114:	435b 5d4d 4220 4e45 4843 535f 4154 5452     [CM] BENCH_START
    5124:	6920 6574 6172 6974 6e6f 3d73 6c25 0d75      iterations=%lu.
    5134:	000a 0000 435b 5d4d 4220 4e45 4843 445f     ....[CM] BENCH_D
    5144:	4e4f 2045 6974 6b63 3d73 6c25 0d75 000a     ONE ticks=%lu...
    5154:	6b36 7020 7265 6f66 6d72 6e61 6563 7220     6k performance r
    5164:	6e75 7020 7261 6d61 7465 7265 2073 6f66     un parameters fo
    5174:	2072 6f63 6572 616d 6b72 0a2e 0000 0000     r coremark......
    5184:	6b36 7620 6c61 6469 7461 6f69 206e 7572     6k validation ru
    5194:	206e 6170 6172 656d 6574 7372 6620 726f     n parameters for
    51a4:	6320 726f 6d65 7261 2e6b 000a 7250 666f      coremark...Prof
    51b4:	6c69 2065 6567 656e 6172 6974 6e6f 7220     ile generation r
    51c4:	6e75 7020 7261 6d61 7465 7265 2073 6f66     un parameters fo
    51d4:	2072 6f63 6572 616d 6b72 0a2e 0000 0000     r coremark......
    51e4:	4b32 7020 7265 6f66 6d72 6e61 6563 7220     2K performance r
    51f4:	6e75 7020 7261 6d61 7465 7265 2073 6f66     un parameters fo
    5204:	2072 6f63 6572 616d 6b72 0a2e 0000 0000     r coremark......
    5214:	4b32 7620 6c61 6469 7461 6f69 206e 7572     2K validation ru
    5224:	206e 6170 6172 656d 6574 7372 6620 726f     n parameters for
    5234:	6320 726f 6d65 7261 2e6b 000a 435b 5d4d      coremark...[CM]
    5244:	4320 4352 565f 4c41 4449 5441 5f45 4542      CRC_VALIDATE_BE
    5254:	4947 204e 6e6b 776f 5f6e 6469 253d 0d64     GIN known_id=%d.
    5264:	000a 0000 255b 5d75 5245 4f52 2152 6c20     ....[%u]ERROR! l
    5274:	7369 2074 7263 2063 7830 3025 7834 2d20     ist crc 0x%04x -
    5284:	7320 6f68 6c75 2064 6562 3020 2578 3430      should be 0x%04
    5294:	0a78 0000 255b 5d75 5245 4f52 2152 6d20     x...[%u]ERROR! m
    52a4:	7461 6972 2078 7263 2063 7830 3025 7834     atrix crc 0x%04x
    52b4:	2d20 7320 6f68 6c75 2064 6562 3020 2578      - should be 0x%
    52c4:	3430 0a78 0000 0000 255b 5d75 5245 4f52     04x.....[%u]ERRO
    52d4:	2152 7320 6174 6574 6320 6372 3020 2578     R! state crc 0x%
    52e4:	3430 2078 202d 6873 756f 646c 6220 2065     04x - should be 
    52f4:	7830 3025 7834 000a 435b 5d4d 4320 4352     0x%04x..[CM] CRC
    5304:	565f 4c41 4449 5441 5f45 4f44 454e 7420     _VALIDATE_DONE t
    5314:	746f 6c61 655f 7272 726f 3d73 6425 0a0d     otal_errors=%d..
    5324:	0000 0000 435b 5d4d 4320 4548 4b43 545f     ....[CM] CHECK_T
    5334:	5059 5345 425f 4745 4e49 0a0d 0000 0000     YPES_BEGIN......
    5344:	435b 5d4d 4320 4548 4b43 545f 5059 5345     [CM] CHECK_TYPES
    5354:	445f 4e4f 2045 6f74 6174 5f6c 7265 6f72     _DONE total_erro
    5364:	7372 253d 0d64 000a 435b 5d4d 5220 5045     rs=%d...[CM] REP
    5374:	524f 5f54 4542 4947 204e 6f74 6174 5f6c     ORT_BEGIN total_
    5384:	7265 6f72 7372 253d 2064 6e6b 776f 5f6e     errors=%d known_
    5394:	6469 253d 0d64 000a 6f43 6572 614d 6b72     id=%d...CoreMark
    53a4:	5320 7a69 2065 2020 3a20 2520 756c 000a      Size    : %lu..
    53b4:	6f54 6174 206c 6974 6b63 2073 2020 2020     Total ticks     
    53c4:	3a20 2520 756c 000a 6f54 6174 206c 6974      : %lu..Total ti
    53d4:	656d 2820 6573 7363 3a29 2520 0a64 0000     me (secs): %d...
    53e4:	7449 7265 7461 6f69 736e 532f 6365 2020     Iterations/Sec  
    53f4:	3a20 2520 0a64 0000 6f43 6572 614d 6b72      : %d...CoreMark
    5404:	732f 2020 2020 2020 0020 0000 7325 203a     /s       ...%s: 
    5414:	6c25 2e75 3025 6c33 0a75 0000 6f43 6572     %lu.%03lu...Core
    5424:	614d 6b72 4d2f 7a48 2020 2020 0020 0000     Mark/MHz     ...
    5434:	5245 4f52 2152 4d20 7375 2074 7865 6365     ERROR! Must exec
    5444:	7475 2065 6f66 2072 7461 6c20 6165 7473     ute for at least
    5454:	3120 2030 6573 7363 6620 726f 6120 7620      10 secs for a v
    5464:	6c61 6469 7220 7365 6c75 2174 000a 0000     alid result!....
    5474:	7449 7265 7461 6f69 736e 2020 2020 2020     Iterations      
    5484:	3a20 2520 756c 000a 4347 2043 5652 3233      : %lu..GCC RV32
    5494:	4d49 0000 6f43 706d 6c69 7265 7620 7265     IM..Compiler ver
    54a4:	6973 6e6f 3a20 2520 0a73 0000 4f2d 2032     sion : %s...-O2 
    54b4:	6d2d 7261 6863 723d 3376 6932 206d 6d2d     -march=rv32im -m
    54c4:	6261 3d69 6c69 3370 0032 0000 6f43 706d     abi=ilp32...Comp
    54d4:	6c69 7265 6620 616c 7367 2020 3a20 2520     iler flags   : %
    54e4:	0a73 0000 5453 5441 4349 0000 654d 6f6d     s...STATIC..Memo
    54f4:	7972 6c20 636f 7461 6f69 206e 3a20 2520     ry location  : %
    5504:	0a73 0000 6573 6465 7263 2063 2020 2020     s...seedcrc     
    5514:	2020 2020 3a20 3020 2578 3430 0a78 0000          : 0x%04x...
    5524:	255b 5d64 7263 6c63 7369 2074 2020 2020     [%d]crclist     
    5534:	2020 203a 7830 3025 7834 000a 255b 5d64       : 0x%04x..[%d]
    5544:	7263 6d63 7461 6972 2078 2020 2020 203a     crcmatrix     : 
    5554:	7830 3025 7834 000a 255b 5d64 7263 7363     0x%04x..[%d]crcs
    5564:	6174 6574 2020 2020 2020 203a 7830 3025     tate      : 0x%0
    5574:	7834 000a 255b 5d64 7263 6663 6e69 6c61     4x..[%d]crcfinal
    5584:	2020 2020 2020 203a 7830 3025 7834 000a           : 0x%04x..
    5594:	6f43 7272 6365 2074 706f 7265 7461 6f69     Correct operatio
    55a4:	206e 6176 696c 6164 6574 2e64 5320 6565     n validated. See
    55b4:	5220 4145 4d44 2e45 646d 6620 726f 7220      README.md for r
    55c4:	6e75 6120 646e 7220 7065 726f 6974 676e     un and reporting
    55d4:	7220 6c75 7365 0a2e 0000 0000 6f43 6572      rules......Core
    55e4:	614d 6b72 3120 302e 3a20 2520 756c 252e     Mark 1.0 : %lu.%
    55f4:	3330 756c 2f20 2520 2073 7325 0000 0000     03lu / %s %s....
    5604:	2f20 2520 0073 0000 7245 6f72 7372 6420      / %s...Errors d
    5614:	7465 6365 6574 0a64 0000 0000 6143 6e6e     etected.....Cann
    5624:	746f 7620 6c61 6469 7461 2065 706f 7265     ot validate oper
    5634:	7461 6f69 206e 6f66 2072 6874 7365 2065     ation for these 
    5644:	6573 6465 7620 6c61 6575 2c73 7020 656c     seed values, ple
    5654:	7361 2065 6f63 706d 7261 2065 6977 6874     ase compare with
    5664:	7220 7365 6c75 7374 6f20 206e 2061 6e6b      results on a kn
    5674:	776f 206e 6c70 7461 6f66 6d72 0a2e 0000     own platform....

00005684 <matrix_known_crc>:
    5684:	be52 1199 5608 1fd7 0747 0000               R....V..G...

00005690 <state_known_crc>:
    5690:	5e47 39bf e5a4 8e3a 8d84 0000 4d5b 5854     G^.9..:.....[MTX
    56a0:	205d 4542 434e 5f48 4e45 4554 2052 3d6e     ] BENCH_ENTER n=
    56b0:	6c25 2075 6573 6465 303d 2578 3430 2078     %lu seed=0x%04x 
    56c0:	7263 3d63 7830 3025 7834 4120 303d 2578     crc=0x%04x A=0x%
    56d0:	3830 786c 4220 303d 2578 3830 786c 4320     08lx B=0x%08lx C
    56e0:	303d 2578 3830 786c 0a0d 0000 4d5b 5854     =0x%08lx....[MTX
    56f0:	205d 4542 434e 5f48 4f44 454e 6320 6372     ] BENCH_DONE crc
    5700:	303d 2578 3430 0d78 000a 0000 4d5b 5854     =0x%04x.....[MTX
    5710:	205d 4554 5453 425f 4745 4e49 6e20 253d     ] TEST_BEGIN n=%
    5720:	756c 7620 6c61 303d 2578 3430 2078 6c63     lu val=0x%04x cl
    5730:	7069 303d 2578 3430 0d78 000a 4d5b 5854     ip=0x%04x...[MTX
    5740:	205d 4441 5f44 4f43 534e 5f54 5f31 4542     ] ADD_CONST_1_BE
    5750:	4947 0d4e 000a 0000 4d5b 5854 205d 4441     GIN.....[MTX] AD
    5760:	5f44 4f43 534e 5f54 5f31 4f44 454e 0a0d     D_CONST_1_DONE..
    5770:	0000 0000 4d5b 5854 205d 554d 5f4c 4f43     ....[MTX] MUL_CO
    5780:	534e 5f54 4542 4947 0d4e 000a 4d5b 5854     NST_BEGIN...[MTX
    5790:	205d 554d 5f4c 4f43 534e 5f54 4f44 454e     ] MUL_CONST_DONE
    57a0:	0a0d 0000 4d5b 5854 205d 5553 314d 425f     ....[MTX] SUM1_B
    57b0:	4745 4e49 0a0d 0000 4d5b 5854 205d 5553     EGIN....[MTX] SU
    57c0:	314d 445f 4e4f 2045 7263 3d63 7830 3025     M1_DONE crc=0x%0
    57d0:	7834 0a0d 0000 0000 4d5b 5854 205d 554d     4x......[MTX] MU
    57e0:	5f4c 4556 5443 425f 4745 4e49 0a0d 0000     L_VECT_BEGIN....
    57f0:	4d5b 5854 205d 554d 5f4c 4556 5443 445f     [MTX] MUL_VECT_D
    5800:	4e4f 0d45 000a 0000 4d5b 5854 205d 5553     ONE.....[MTX] SU
    5810:	324d 425f 4745 4e49 0a0d 0000 4d5b 5854     M2_BEGIN....[MTX
    5820:	205d 5553 324d 445f 4e4f 2045 7263 3d63     ] SUM2_DONE crc=
    5830:	7830 3025 7834 0a0d 0000 0000 4d5b 5854     0x%04x......[MTX
    5840:	205d 554d 5f4c 414d 5254 5849 425f 4745     ] MUL_MATRIX_BEG
    5850:	4e49 0a0d 0000 0000 4d5b 5854 205d 554d     IN......[MTX] MU
    5860:	5f4c 414d 5254 5849 445f 4e4f 0d45 000a     L_MATRIX_DONE...
    5870:	4d5b 5854 205d 5553 334d 425f 4745 4e49     [MTX] SUM3_BEGIN
    5880:	0a0d 0000 4d5b 5854 205d 5553 334d 445f     ....[MTX] SUM3_D
    5890:	4e4f 2045 7263 3d63 7830 3025 7834 0a0d     ONE crc=0x%04x..
    58a0:	0000 0000 4d5b 5854 205d 554d 5f4c 4942     ....[MTX] MUL_BI
    58b0:	4554 5458 4152 5443 425f 4745 4e49 0a0d     TEXTRACT_BEGIN..
    58c0:	0000 0000 4d5b 5854 205d 554d 5f4c 4942     ....[MTX] MUL_BI
    58d0:	4554 5458 4152 5443 445f 4e4f 0d45 000a     TEXTRACT_DONE...
    58e0:	4d5b 5854 205d 5553 344d 425f 4745 4e49     [MTX] SUM4_BEGIN
    58f0:	0a0d 0000 4d5b 5854 205d 4554 5453 445f     ....[MTX] TEST_D
    5900:	4e4f 2045 7263 3d63 7830 3025 7834 0a0d     ONE crc=0x%04x..
    5910:	0000 0000 4d5b 5854 205d 5553 344d 445f     ....[MTX] SUM4_D
    5920:	4e4f 2045 7263 3d63 7830 3025 7834 0a0d     ONE crc=0x%04x..
    5930:	0000 0000 4d5b 5854 205d 4441 5f44 4f43     ....[MTX] ADD_CO
    5940:	534e 5f54 4552 5453 524f 5f45 4542 4947     NST_RESTORE_BEGI
    5950:	0d4e 000a cf38 ffff cf38 ffff cf84 ffff     N...8...8.......
    5960:	cf84 ffff cf94 ffff 535b 5d54 4220 4e45     ........[ST] BEN
    5970:	4843 455f 544e 5245 6220 6b6c 6973 657a     CH_ENTER blksize
    5980:	253d 756c 6d20 6d65 303d 2578 3830 786c     =%lu mem=0x%08lx
    5990:	7320 6565 3164 303d 2578 3430 2078 6573      seed1=0x%04x se
    59a0:	6465 3d32 7830 3025 7834 7320 6574 3d70     ed2=0x%04x step=
    59b0:	7830 3025 7834 6320 6372 303d 2578 3430     0x%04x crc=0x%04
    59c0:	0d78 000a 535b 5d54 5020 5341 3153 425f     x...[ST] PASS1_B
    59d0:	4745 4e49 7020 303d 2578 3830 786c 6620     EGIN p=0x%08lx f
    59e0:	7269 7473 303d 2578 3230 0d78 000a 0000     irst=0x%02x.....
    59f0:	535b 5d54 5020 5341 3153 445f 4e4f 2045     [ST] PASS1_DONE 
    5a00:	3d70 7830 3025 6c38 0d78 000a 535b 5d54     p=0x%08lx...[ST]
    5a10:	4320 524f 5552 5450 425f 4745 4e49 0a0d      CORRUPT_BEGIN..
    5a20:	0000 0000 535b 5d54 4320 524f 5552 5450     ....[ST] CORRUPT
    5a30:	445f 4e4f 0d45 000a 535b 5d54 5020 5341     _DONE...[ST] PAS
    5a40:	3253 425f 4745 4e49 7020 303d 2578 3830     S2_BEGIN p=0x%08
    5a50:	786c 6620 7269 7473 303d 2578 3230 0d78     lx first=0x%02x.
    5a60:	000a 0000 535b 5d54 5020 5341 3253 445f     ....[ST] PASS2_D
    5a70:	4e4f 2045 3d70 7830 3025 6c38 0d78 000a     ONE p=0x%08lx...
    5a80:	535b 5d54 5220 5345 4f54 4552 425f 4745     [ST] RESTORE_BEG
    5a90:	4e49 0a0d 0000 0000 535b 5d54 5220 5345     IN......[ST] RES
    5aa0:	4f54 4552 445f 4e4f 0d45 000a 535b 5d54     TORE_DONE...[ST]
    5ab0:	4220 4e45 4843 445f 4e4f 2045 7263 3d63      BENCH_DONE crc=
    5ac0:	7830 3025 7834 0a0d 0000 0000               0x%04x......

00005acc <errpat>:
    5acc:	5b0c 0000 5b18 0000 5b24 0000 5b30 0000     .[...[..$[..0[..

00005adc <floatpat>:
    5adc:	5b6c 0000 5b78 0000 5b84 0000 5b90 0000     l[..x[...[...[..

00005aec <intpat>:
    5aec:	5b9c 0000 5ba4 0000 5bac 0000 5bb4 0000     .[...[...[...[..

00005afc <scipat>:
    5afc:	5b3c 0000 5b48 0000 5b54 0000 5b60 0000     <[..H[..T[..`[..
    5b0c:	3054 332e 2d65 4631 0000 0000 542d 542e     T0.3e-1F....-T.T
    5b1c:	2b2b 7154 0000 0000 5431 2e33 6534 7a34     ++Tq....1T3.4e4z
    5b2c:	0000 0000 3433 302e 2d65 5e54 0000 0000     ....34.0e-T^....
    5b3c:	2e35 3035 6530 332b 0000 0000 2e2d 3231     5.500e+3....-.12
    5b4c:	6533 322d 0000 0000 382d 6537 382b 3233     3e-2....-87e+832
    5b5c:	0000 0000 302b 362e 2d65 3231 0000 0000     ....+0.6e-12....
    5b6c:	3533 352e 3434 3030 0000 0000 312e 3332     35.54400.....123
    5b7c:	3534 3030 0000 0000 312d 3031 372e 3030     4500....-110.700
    5b8c:	0000 0000 302b 362e 3434 3030 0000 0000     ....+0.64400....
    5b9c:	3035 3231 0000 0000 3231 3433 0000 0000     5012....1234....
    5bac:	382d 3437 0000 0000 312b 3232 0000 0000     -874....+122....
    5bbc:	d42c ffff d3f4 ffff d400 ffff d40c ffff     ,...............
    5bcc:	d41c ffff d3e8 ffff 6f43 6572 614d 6b72     ........CoreMark
    5bdc:	4620 6e69 7369 6568 2064 7553 6363 7365      Finished Succes
    5bec:	6673 6c75 796c 0d21 000a 0000 0a0d 3d3d     sfully!.......==
    5bfc:	3d3d 3d3d 3d3d 3d3d 3d3d 3d3d 3d3d 3d3d     ================
    5c0c:	3d3d 3d3d 3d3d 3d3d 3d3d 3d3d 3d3d 0d3d     ===============.
    5c1c:	000a 0000 4952 4353 562d 5220 3356 4932     ....RISC-V RV32I
    5c2c:	204d 6f43 6572 614d 6b72 5320 6174 7472     M CoreMark Start
    5c3c:	6465 0d21 000a 0000 6954 656d 2072 4441     ed!.....Timer AD
    5c4c:	5244 203a 7830 4646 4646 3046 3039 0a0d     DR: 0xFFFFF090..
    5c5c:	0000 0000 4155 5452 5420 3a58 3020 4678     ....UART TX: 0xF
    5c6c:	4646 4646 3830 2c30 5320 4154 5554 3a53     FFFF080, STATUS:
    5c7c:	3020 4678 4646 4646 3830 0d34 000a 0000      0xFFFFF084.....
    5c8c:	7246 7165 203a 6425 4820 0d7a 000a 0000     Freq: %d Hz.....
    5c9c:	6954 656d 2072 6173 696e 7974 203a 3074     Timer sanity: t0
    5cac:	253d 756c 7420 3d31 6c25 2075 6564 746c     =%lu t1=%lu delt
    5cbc:	3d61 6c25 0d75 000a 3d3d 3d3d 3d3d 3d3d     a=%lu...========
    5ccc:	3d3d 3d3d 3d3d 3d3d 3d3d 3d3d 3d3d 3d3d     ================
    5cdc:	3d3d 3d3d 3d3d 3d3d 0d3d 000a d9f8 ffff     =========.......
    5cec:	d980 ffff d980 ffff d9ec ffff d980 ffff     ................
    5cfc:	d980 ffff d980 ffff d980 ffff d980 ffff     ................
    5d0c:	d980 ffff d980 ffff d9e0 ffff d980 ffff     ................
    5d1c:	d9d4 ffff d980 ffff d980 ffff d964 ffff     ............d...
    5d2c:	ded0 ffff dbd0 ffff dbd0 ffff dbd0 ffff     ................
    5d3c:	dbd0 ffff dbd0 ffff dbd0 ffff dbd0 ffff     ................
    5d4c:	dbd0 ffff dbd0 ffff dbd0 ffff dbd0 ffff     ................
    5d5c:	dbd0 ffff dbd0 ffff dbd0 ffff dbd0 ffff     ................
    5d6c:	dbd0 ffff dbd0 ffff dbd0 ffff dbd0 ffff     ................
    5d7c:	dbd0 ffff dbd0 ffff dbd0 ffff da78 ffff     ............x...
    5d8c:	dbd0 ffff dbd0 ffff dbd0 ffff dbd0 ffff     ................
    5d9c:	dbd0 ffff dbd0 ffff dbd0 ffff dbd0 ffff     ................
    5dac:	dd90 ffff dbd0 ffff db7c ffff dee0 ffff     ........|.......
    5dbc:	dbd0 ffff dbd0 ffff dbd0 ffff dbd0 ffff     ................
    5dcc:	dee0 ffff dbd0 ffff dbd0 ffff dbd0 ffff     ................
    5ddc:	dbd0 ffff dbd0 ffff db70 ffff db44 ffff     ........p...D...
    5dec:	dbd0 ffff dbd0 ffff dab0 ffff dbd0 ffff     ................
    5dfc:	daa4 ffff dbd0 ffff dbd0 ffff dd84 ffff     ................
    5e0c:	db6c ffff daf8 ffff daf8 ffff daf8 ffff     l...............
    5e1c:	daf8 ffff daf8 ffff daf8 ffff daf8 ffff     ................
    5e2c:	daf8 ffff daf8 ffff daf8 ffff daf8 ffff     ................
    5e3c:	daf8 ffff daf8 ffff daf8 ffff daf8 ffff     ................
    5e4c:	daf8 ffff daf8 ffff daf8 ffff daf8 ffff     ................
    5e5c:	daf8 ffff daf8 ffff daf8 ffff d99c ffff     ................
    5e6c:	daf8 ffff daf8 ffff daf8 ffff daf8 ffff     ................
    5e7c:	daf8 ffff daf8 ffff daf8 ffff daf8 ffff     ................
    5e8c:	dc64 ffff daf8 ffff daa0 ffff dc8c ffff     d...............
    5e9c:	daf8 ffff daf8 ffff daf8 ffff daf8 ffff     ................
    5eac:	dc8c ffff daf8 ffff daf8 ffff daf8 ffff     ................
    5ebc:	daf8 ffff daf8 ffff da94 ffff da68 ffff     ............h...
    5ecc:	daf8 ffff daf8 ffff d9d4 ffff daf8 ffff     ................
    5edc:	d9c8 ffff daf8 ffff daf8 ffff d9a0 ffff     ................
    5eec:	4e3c 4c55 3e4c 0000 3130 3332 3534 3736     <NULL>..01234567
    5efc:	3938 6261 6463 6665 6867 6a69 6c6b 6e6d     89abcdefghijklmn
    5f0c:	706f 7271 7473 7675 7877 7a79 0000 0000     opqrstuvwxyz....
    5f1c:	3130 3332 3534 3736 3938 4241 4443 4645     0123456789ABCDEF
    5f2c:	4847 4a49 4c4b 4e4d 504f 5251 5453 5655     GHIJKLMNOPQRSTUV
    5f3c:	5857 5a59 0000 0000                         WXYZ....

00005f44 <__clz_tab>:
    5f44:	0100 0202 0303 0303 0404 0404 0404 0404     ................
    5f54:	0505 0505 0505 0505 0505 0505 0505 0505     ................
    5f64:	0606 0606 0606 0606 0606 0606 0606 0606     ................
    5f74:	0606 0606 0606 0606 0606 0606 0606 0606     ................
    5f84:	0707 0707 0707 0707 0707 0707 0707 0707     ................
    5f94:	0707 0707 0707 0707 0707 0707 0707 0707     ................
    5fa4:	0707 0707 0707 0707 0707 0707 0707 0707     ................
    5fb4:	0707 0707 0707 0707 0707 0707 0707 0707     ................
    5fc4:	0808 0808 0808 0808 0808 0808 0808 0808     ................
    5fd4:	0808 0808 0808 0808 0808 0808 0808 0808     ................
    5fe4:	0808 0808 0808 0808 0808 0808 0808 0808     ................
    5ff4:	0808 0808 0808 0808 0808 0808 0808 0808     ................
    6004:	0808 0808 0808 0808 0808 0808 0808 0808     ................
    6014:	0808 0808 0808 0808 0808 0808 0808 0808     ................
    6024:	0808 0808 0808 0808 0808 0808 0808 0808     ................
    6034:	0808 0808 0808 0808 0808 0808 0808 0808     ................
