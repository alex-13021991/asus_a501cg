/* Release Version: ci_master_byt_20130905_2200 */
/*
 * Support for Intel Camera Imaging ISP subsystem.
 *
 * Copyright (c) 2010 - 2013 Intel Corporation. All Rights Reserved.
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License version
 * 2 as published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
 * 02110-1301, USA.
 *
 */

#ifndef __DEBUG_GLOBAL_H_INCLUDED__
#define __DEBUG_GLOBAL_H_INCLUDED__

#ifdef __KERNEL__
#include <linux/types.h>
#else
#include <stdint.h>
#endif

#define DEBUG_BUF_SIZE	1024
#define DEBUG_BUF_MASK	(DEBUG_BUF_SIZE - 1)

#define DEBUG_DATA_ENABLE_ADDR		0x00
#define DEBUG_DATA_BUF_MODE_ADDR	0x04
#define DEBUG_DATA_HEAD_ADDR		0x08
#define DEBUG_DATA_TAIL_ADDR		0x0C
#define DEBUG_DATA_BUF_ADDR			0x10

#define DEBUG_DATA_ENABLE_DDR_ADDR		0x00
#define DEBUG_DATA_BUF_MODE_DDR_ADDR	HIVE_ISP_DDR_WORD_BYTES
#define DEBUG_DATA_HEAD_DDR_ADDR		(2 * HIVE_ISP_DDR_WORD_BYTES)
#define DEBUG_DATA_TAIL_DDR_ADDR		(3 * HIVE_ISP_DDR_WORD_BYTES)
#define DEBUG_DATA_BUF_DDR_ADDR			(4 * HIVE_ISP_DDR_WORD_BYTES)

#define DEBUG_BUFFER_ISP_DMEM_ADDR       0x0

/* Enable HAS_WATCHDOG_SP_THREAD_DEBUG for additional SP thread and
   pipe information on watchdog output */
//#define HAS_WATCHDOG_SP_THREAD_DEBUG
#undef HAS_WATCHDOG_SP_THREAD_DEBUG

/*
 * The linear buffer mode will accept data until the first
 * overflow and then stop accepting new data
 * The circular buffer mode will accept if there is place
 * and discard the data if the buffer is full
 */
typedef enum {
	DEBUG_BUFFER_MODE_LINEAR = 0,
	DEBUG_BUFFER_MODE_CIRCULAR,
	N_DEBUG_BUFFER_MODE
} debug_buf_mode_t;

struct debug_data_s {
	uint32_t			enable;
	uint32_t			bufmode;
	uint32_t			head;
	uint32_t			tail;
	uint32_t			buf[DEBUG_BUF_SIZE];
};

/* thread.sp.c doesn't have a notion of HIVE_ISP_DDR_WORD_BYTES
   still one point of control is needed for debug purposes */

#ifdef HIVE_ISP_DDR_WORD_BYTES
struct debug_data_ddr_s {
	uint32_t			enable;
	int8_t				padding1[HIVE_ISP_DDR_WORD_BYTES-sizeof(uint32_t)];
	uint32_t			bufmode;
	int8_t				padding2[HIVE_ISP_DDR_WORD_BYTES-sizeof(uint32_t)];
	uint32_t			head;
	int8_t				padding3[HIVE_ISP_DDR_WORD_BYTES-sizeof(uint32_t)];
	uint32_t			tail;
	int8_t				padding4[HIVE_ISP_DDR_WORD_BYTES-sizeof(uint32_t)];
	uint32_t			buf[DEBUG_BUF_SIZE];
};
#endif

#endif /* __DEBUG_GLOBAL_H_INCLUDED__ */

