/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     OC_LS = 258,
     OC_PS = 259,
     OC_MKDIR = 260,
     OC_RMDIR = 261,
     OC_CD = 262,
     OC_TOUCH = 263,
     OC_IFCONFIG = 264,
     OC_START = 265,
     OC_QUIT = 266,
     OC_NEWLINE = 267,
     OC_STRING = 268,
     OC_KILL = 269,
     OC_INT = 270,
     OC_FLOAT = 271,
     OC_PLUS = 272,
     OC_MINUS = 273,
     OC_TIMES = 274,
     OC_DIVIDED = 275
   };
#endif
/* Tokens.  */
#define OC_LS 258
#define OC_PS 259
#define OC_MKDIR 260
#define OC_RMDIR 261
#define OC_CD 262
#define OC_TOUCH 263
#define OC_IFCONFIG 264
#define OC_START 265
#define OC_QUIT 266
#define OC_NEWLINE 267
#define OC_STRING 268
#define OC_KILL 269
#define OC_INT 270
#define OC_FLOAT 271
#define OC_PLUS 272
#define OC_MINUS 273
#define OC_TIMES 274
#define OC_DIVIDED 275




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 19 "carvalho.y"
{
	int 	oc_int;
	float 	oc_float;
	char 	oc_char;
	char*	oc_string;
}
/* Line 1529 of yacc.c.  */
#line 96 "carvalho.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

