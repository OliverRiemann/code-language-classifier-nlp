#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>

#define U1 unsigned char
#define S1 char
#define	S4 int
#define S8 long

#define TRUE					(1)
#define FALSE					(0)

#define RATE_OF_INTEREST        (105)    /* 借金の利率(%) */
#define PERCENT                 (100)    /* 割合をパーセントに変換する定数 */
#define ROUNDUP_THRESHOLD       (1000)   /* 切り上げの閾値 */
#define AMOUNT_OF_DEBT          (100000) /* 借金の金額 */

S4 main(void)
{
	S4 s4_t_balance;	/* 借金残高 */
	S4 s4_t_week;		/* 借金をしてから経過した週間 */
	S4 s4_t_cnt;		/* 残高計算用のカウンタ */
	S4 s4_t_mod;		/* 切り上げ計算用余り */
	U1 u1_t_delimiter;	/* scanfの改行を捨てるための変数 */

	/* 経過した週間を入力 */
	(void)scanf("%d%c", &s4_t_week, &u1_t_delimiter);

	/* 借金の初期値 */
	s4_t_balance = (S4)AMOUNT_OF_DEBT;

	/* 残高を計算 */
	for (s4_t_cnt = (S4)0; s4_t_cnt < s4_t_week; s4_t_cnt++)
	{
		/* 利子を加算 */
		s4_t_balance = s4_t_balance * (S4)RATE_OF_INTEREST / (S4)PERCENT;

		/* 1000円未満は切り上げ */
		s4_t_mod = s4_t_balance % (S4)ROUNDUP_THRESHOLD;
		if (s4_t_mod > (S4)0)
		{
			s4_t_balance = ((s4_t_balance / (S4)ROUNDUP_THRESHOLD) + (S4)1) * (S4)ROUNDUP_THRESHOLD;
		}
	}

	/* 残高を出力する */
	printf("%d\n", s4_t_balance);

	return((S4)0);
}

