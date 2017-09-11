/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "D:/6.Semester/ES/Projekte/FHDWasalu/claAdder.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1605435078_503743352(char *, unsigned char , unsigned char );
char *ieee_p_2592010699_sub_1697423399_503743352(char *, char *, char *, char *, char *, char *);
char *ieee_p_2592010699_sub_1735675855_503743352(char *, char *, char *, char *, char *, char *);
unsigned char ieee_p_2592010699_sub_2545490612_503743352(char *, unsigned char , unsigned char );
char *ieee_p_2592010699_sub_795620321_503743352(char *, char *, char *, char *, char *, char *);


static void work_a_3810799113_3212880686_p_0(char *t0)
{
    char t18[16];
    char t45[16];
    char t46[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned char t10;
    char *t11;
    char *t12;
    int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    char *t17;
    char *t19;
    char *t20;
    char *t21;
    int t22;
    int t23;
    int t24;
    int t25;
    char *t26;
    int t27;
    int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;
    unsigned char t33;
    unsigned char t34;
    char *t35;
    char *t36;
    int t37;
    int t38;
    int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    char *t43;
    char *t44;

LAB0:    xsi_set_current_line(61, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(81, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 4136);
    t5 = (t1 + 56U);
    t11 = *((char **)t5);
    t12 = (t11 + 56U);
    t17 = *((char **)t12);
    memcpy(t17, t2, 8U);
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(82, ng0);
    t1 = (t0 + 4072);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t11 = (t5 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB3:    t1 = (t0 + 3992);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(62, ng0);
    t1 = (t0 + 1032U);
    t5 = *((char **)t1);
    t6 = (7 - 7);
    t7 = (t6 * -1);
    t8 = (1U * t7);
    t9 = (0 + t8);
    t1 = (t5 + t9);
    t10 = *((unsigned char *)t1);
    t11 = (t0 + 2448U);
    t12 = *((char **)t11);
    t13 = (8 - 8);
    t14 = (t13 * -1);
    t15 = (1U * t14);
    t16 = (0 + t15);
    t11 = (t12 + t16);
    *((unsigned char *)t11) = t10;
    t17 = (t0 + 2392U);
    xsi_variable_act(t17);
    xsi_set_current_line(63, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 2448U);
    t5 = *((char **)t1);
    t7 = (8 - 7);
    t8 = (t7 * 1U);
    t9 = (0 + t8);
    t1 = (t5 + t9);
    memcpy(t1, t2, 8U);
    t11 = (t0 + 2392U);
    xsi_variable_act(t11);
    xsi_set_current_line(65, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t6 = (7 - 7);
    t7 = (t6 * -1);
    t8 = (1U * t7);
    t9 = (0 + t8);
    t1 = (t2 + t9);
    t3 = *((unsigned char *)t1);
    t5 = (t0 + 2568U);
    t11 = *((char **)t5);
    t13 = (8 - 8);
    t14 = (t13 * -1);
    t15 = (1U * t14);
    t16 = (0 + t15);
    t5 = (t11 + t16);
    *((unsigned char *)t5) = t3;
    t12 = (t0 + 2512U);
    xsi_variable_act(t12);
    xsi_set_current_line(66, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 2568U);
    t5 = *((char **)t1);
    t7 = (8 - 7);
    t8 = (t7 * 1U);
    t9 = (0 + t8);
    t1 = (t5 + t9);
    memcpy(t1, t2, 8U);
    t11 = (t0 + 2512U);
    xsi_variable_act(t11);
    xsi_set_current_line(68, ng0);
    t1 = (t0 + 2448U);
    t2 = *((char **)t1);
    t1 = (t0 + 6400U);
    t5 = (t0 + 2568U);
    t11 = *((char **)t5);
    t5 = (t0 + 6416U);
    t12 = ieee_p_2592010699_sub_1697423399_503743352(IEEE_P_2592010699, t18, t2, t1, t11, t5);
    t17 = (t0 + 1968U);
    t19 = *((char **)t17);
    t17 = (t19 + 0);
    t20 = (t18 + 12U);
    t7 = *((unsigned int *)t20);
    t8 = (1U * t7);
    memcpy(t17, t12, t8);
    t21 = (t0 + 1912U);
    xsi_variable_act(t21);
    xsi_set_current_line(69, ng0);
    t1 = (t0 + 2448U);
    t2 = *((char **)t1);
    t1 = (t0 + 6400U);
    t5 = (t0 + 2568U);
    t11 = *((char **)t5);
    t5 = (t0 + 6416U);
    t12 = ieee_p_2592010699_sub_795620321_503743352(IEEE_P_2592010699, t18, t2, t1, t11, t5);
    t17 = (t0 + 2088U);
    t19 = *((char **)t17);
    t17 = (t19 + 0);
    t20 = (t18 + 12U);
    t7 = *((unsigned int *)t20);
    t8 = (1U * t7);
    memcpy(t17, t12, t8);
    t21 = (t0 + 2032U);
    xsi_variable_act(t21);
    xsi_set_current_line(70, ng0);
    t1 = (t0 + 2448U);
    t2 = *((char **)t1);
    t1 = (t0 + 6400U);
    t5 = (t0 + 2568U);
    t11 = *((char **)t5);
    t5 = (t0 + 6416U);
    t12 = ieee_p_2592010699_sub_1735675855_503743352(IEEE_P_2592010699, t18, t2, t1, t11, t5);
    t17 = (t0 + 2208U);
    t19 = *((char **)t17);
    t17 = (t19 + 0);
    t20 = (t18 + 12U);
    t7 = *((unsigned int *)t20);
    t8 = (1U * t7);
    memcpy(t17, t12, t8);
    t21 = (t0 + 2152U);
    xsi_variable_act(t21);
    xsi_set_current_line(71, ng0);
    t1 = (t0 + 2088U);
    t2 = *((char **)t1);
    t6 = (0 - 8);
    t7 = (t6 * -1);
    t8 = (1U * t7);
    t9 = (0 + t8);
    t1 = (t2 + t9);
    t3 = *((unsigned char *)t1);
    t5 = (t0 + 2328U);
    t11 = *((char **)t5);
    t13 = (1 - 8);
    t14 = (t13 * -1);
    t15 = (1U * t14);
    t16 = (0 + t15);
    t5 = (t11 + t16);
    *((unsigned char *)t5) = t3;
    t12 = (t0 + 2272U);
    xsi_variable_act(t12);
    xsi_set_current_line(72, ng0);
    t1 = (t0 + 6535);
    *((int *)t1) = 1;
    t2 = (t0 + 6539);
    *((int *)t2) = 7;
    t6 = 1;
    t13 = 7;

LAB5:    if (t6 <= t13)
        goto LAB6;

LAB8:    xsi_set_current_line(75, ng0);
    t1 = (t0 + 2088U);
    t2 = *((char **)t1);
    t6 = (7 - 8);
    t7 = (t6 * -1);
    t8 = (1U * t7);
    t9 = (0 + t8);
    t1 = (t2 + t9);
    t3 = *((unsigned char *)t1);
    t5 = (t0 + 2208U);
    t11 = *((char **)t5);
    t13 = (7 - 8);
    t14 = (t13 * -1);
    t15 = (1U * t14);
    t16 = (0 + t15);
    t5 = (t11 + t16);
    t4 = *((unsigned char *)t5);
    t12 = (t0 + 2328U);
    t17 = *((char **)t12);
    t22 = (7 - 8);
    t29 = (t22 * -1);
    t30 = (1U * t29);
    t31 = (0 + t30);
    t12 = (t17 + t31);
    t10 = *((unsigned char *)t12);
    t33 = ieee_p_2592010699_sub_1605435078_503743352(IEEE_P_2592010699, t4, t10);
    t34 = ieee_p_2592010699_sub_2545490612_503743352(IEEE_P_2592010699, t3, t33);
    t19 = (t0 + 4072);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    t26 = (t21 + 56U);
    t32 = *((char **)t26);
    *((unsigned char *)t32) = t34;
    xsi_driver_first_trans_fast_port(t19);
    xsi_set_current_line(76, ng0);
    t1 = (t0 + 1968U);
    t2 = *((char **)t1);
    t6 = (0 - 8);
    t7 = (t6 * -1);
    t8 = (1U * t7);
    t9 = (0 + t8);
    t1 = (t2 + t9);
    t3 = *((unsigned char *)t1);
    t5 = (t0 + 2688U);
    t11 = *((char **)t5);
    t13 = (0 - 8);
    t14 = (t13 * -1);
    t15 = (1U * t14);
    t16 = (0 + t15);
    t5 = (t11 + t16);
    *((unsigned char *)t5) = t3;
    t12 = (t0 + 2632U);
    xsi_variable_act(t12);
    xsi_set_current_line(77, ng0);
    t1 = (t0 + 1968U);
    t2 = *((char **)t1);
    t7 = (8 - 8);
    t8 = (t7 * 1U);
    t9 = (0 + t8);
    t1 = (t2 + t9);
    t5 = (t45 + 0U);
    t11 = (t5 + 0U);
    *((int *)t11) = 8;
    t11 = (t5 + 4U);
    *((int *)t11) = 1;
    t11 = (t5 + 8U);
    *((int *)t11) = -1;
    t6 = (1 - 8);
    t14 = (t6 * -1);
    t14 = (t14 + 1);
    t11 = (t5 + 12U);
    *((unsigned int *)t11) = t14;
    t11 = (t0 + 2328U);
    t12 = *((char **)t11);
    t14 = (8 - 8);
    t15 = (t14 * 1U);
    t16 = (0 + t15);
    t11 = (t12 + t16);
    t17 = (t46 + 0U);
    t19 = (t17 + 0U);
    *((int *)t19) = 8;
    t19 = (t17 + 4U);
    *((int *)t19) = 1;
    t19 = (t17 + 8U);
    *((int *)t19) = -1;
    t13 = (1 - 8);
    t29 = (t13 * -1);
    t29 = (t29 + 1);
    t19 = (t17 + 12U);
    *((unsigned int *)t19) = t29;
    t19 = ieee_p_2592010699_sub_1697423399_503743352(IEEE_P_2592010699, t18, t1, t45, t11, t46);
    t20 = (t0 + 2688U);
    t21 = *((char **)t20);
    t29 = (8 - 8);
    t30 = (t29 * 1U);
    t31 = (0 + t30);
    t20 = (t21 + t31);
    t26 = (t18 + 12U);
    t40 = *((unsigned int *)t26);
    t41 = (1U * t40);
    memcpy(t20, t19, t41);
    t32 = (t0 + 2632U);
    xsi_variable_act(t32);
    xsi_set_current_line(79, ng0);
    t1 = (t0 + 2688U);
    t2 = *((char **)t1);
    t7 = (8 - 7);
    t8 = (t7 * 1U);
    t9 = (0 + t8);
    t1 = (t2 + t9);
    t5 = (t0 + 4136);
    t11 = (t5 + 56U);
    t12 = *((char **)t11);
    t17 = (t12 + 56U);
    t19 = *((char **)t17);
    memcpy(t19, t1, 8U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB3;

LAB6:    xsi_set_current_line(73, ng0);
    t5 = (t0 + 2088U);
    t11 = *((char **)t5);
    t5 = (t0 + 6535);
    t22 = *((int *)t5);
    t23 = (t22 - 8);
    t7 = (t23 * -1);
    xsi_vhdl_check_range_of_index(8, 0, -1, *((int *)t5));
    t8 = (1U * t7);
    t9 = (0 + t8);
    t12 = (t11 + t9);
    t3 = *((unsigned char *)t12);
    t17 = (t0 + 2208U);
    t19 = *((char **)t17);
    t17 = (t0 + 6535);
    t24 = *((int *)t17);
    t25 = (t24 - 8);
    t14 = (t25 * -1);
    xsi_vhdl_check_range_of_index(8, 0, -1, *((int *)t17));
    t15 = (1U * t14);
    t16 = (0 + t15);
    t20 = (t19 + t16);
    t4 = *((unsigned char *)t20);
    t21 = (t0 + 2328U);
    t26 = *((char **)t21);
    t21 = (t0 + 6535);
    t27 = *((int *)t21);
    t28 = (t27 - 8);
    t29 = (t28 * -1);
    xsi_vhdl_check_range_of_index(8, 1, -1, *((int *)t21));
    t30 = (1U * t29);
    t31 = (0 + t30);
    t32 = (t26 + t31);
    t10 = *((unsigned char *)t32);
    t33 = ieee_p_2592010699_sub_1605435078_503743352(IEEE_P_2592010699, t4, t10);
    t34 = ieee_p_2592010699_sub_2545490612_503743352(IEEE_P_2592010699, t3, t33);
    t35 = (t0 + 2328U);
    t36 = *((char **)t35);
    t35 = (t0 + 6535);
    t37 = *((int *)t35);
    t38 = (t37 + 1);
    t39 = (t38 - 8);
    t40 = (t39 * -1);
    xsi_vhdl_check_range_of_index(8, 1, -1, t38);
    t41 = (1U * t40);
    t42 = (0 + t41);
    t43 = (t36 + t42);
    *((unsigned char *)t43) = t34;
    t44 = (t0 + 2272U);
    xsi_variable_act(t44);

LAB7:    t1 = (t0 + 6535);
    t6 = *((int *)t1);
    t2 = (t0 + 6539);
    t13 = *((int *)t2);
    if (t6 == t13)
        goto LAB8;

LAB9:    t22 = (t6 + 1);
    t6 = t22;
    t5 = (t0 + 6535);
    *((int *)t5) = t6;
    goto LAB5;

}


extern void work_a_3810799113_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3810799113_3212880686_p_0};
	xsi_register_didat("work_a_3810799113_3212880686", "isim/asalu2_tb_isim_beh.exe.sim/work/a_3810799113_3212880686.didat");
	xsi_register_executes(pe);
}
