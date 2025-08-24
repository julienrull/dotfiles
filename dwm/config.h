/* See LICENSE file for copyright and license details. */
#include <X11/XF86keysym.h>

/* appearance */
static const unsigned int borderpx  = 3;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "IosevkaTermNerdFont:size=18:style=Bold" };
static const char dmenufont[]       = "IosevkaTermNerdFont:size=18:style=Bold";

//static const char normfgcolor[]                = "#ebdbb2";
//static const char normbgcolor[]                = "#282828";
//static const char normbordercolor[]            = "#3c3836";
//static const char normfloatcolor[]             = "#db8fd9";
//
//static const char selfgcolor[]                 = "#fbf1c7";
//static const char selbgcolor[]                 = "#d65d0e";
//static const char selbordercolor[]             = "#d65d0e";
//static const char selfloatcolor[]              = "#d65d0e";

static const char normfgcolor[]                = "#E4E4E4";
static const char normbgcolor[]                = "#282828";
static const char normbordercolor[]            = "#52494E";
static const char normfloatcolor[]             = "#52494E";

static const char selfgcolor[]                 = "#E4E4E4";
static const char selbgcolor[]                 = "#52494E";
static const char selbordercolor[]             = "#52494E";
static const char selfloatcolor[]              = "#52494E";

/*
 M = {
	none = Color.none(),
	fg = Color.new(0xe4e4e4),
	["fg+1"] = Color.new(0xf4f4ff),
	["fg+2"] = Color.new(0xf5f5f5),
	white = Color.new(0xffffff),
	black = Color.new(0x000000),
	["bg-1"] = Color.new(0x101010),
	bg = Color.new(0x181818),
	["bg+1"] = Color.new(0x282828),
	["bg+2"] = Color.new(0x453d41),
	["bg+3"] = Color.new(0x484848),
	["bg+4"] = Color.new(0x52494e),
	["red-1"] = Color.new(0xc73c3f),
	red = Color.new(0xf43841),
	["red+1"] = Color.new(0xff4f58),
	green = Color.new(0x73d936),
	yellow = Color.new(0xffdd33),
	brown = Color.new(0xcc8c3c),
	quartz = Color.new(0x95a99f),
	["niagara-2"] = Color.new(0x303540),
	["niagara-1"] = Color.new(0x565f73),
	niagara = Color.new(0x96a6c8),
	wisteria = Color.new(0x9e95c7),
}
 * */

static const char *colors[][3] = {
	/*                       fg                bg                border        */
	[SchemeNorm]         = { normfgcolor,      normbgcolor,      normbordercolor },
	[SchemeSel]          = { selfgcolor,       selbgcolor,       selbordercolor },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "nothing",     NULL,       NULL,       0,            1,           -1 },
	//{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
	//{ "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */
static const int refreshrate = 120;  /* refresh rate (per second) for client move/resize */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */

static const char *dmenucmd[] = {
	//"dmenu_run",
	"dmenu_run_desktop",
	"-m", dmenumon,
	"-fn", dmenufont,
	"-nb", normbgcolor,
	"-nf", normfgcolor,
	"-sb", selbgcolor,
	"-sf", selfgcolor,
	NULL
};
static const char *roficmd[] = {
	"rofi",
	"-show", 
	"drun",
    "-modi",
	"drun",
	NULL
};
static const char *termcmd[]  = { "wezterm", NULL };
static const char *boomercmd[]  = { "/home/julien/Git/boomer/boomer", NULL };
static const char *slockcmd[]  = { "slock", NULL };

static const char *mutecmd[]   = { "pactl", "set-sink-mute",   "@DEFAULT_SINK@", "toggle", NULL };
static const char *volupcmd[]  = { "pactl", "set-sink-volume", "@DEFAULT_SINK@", "+5%",    NULL };
static const char *voldowncmd[] = { "pactl","set-sink-volume", "@DEFAULT_SINK@", "-5%",    NULL };

static const Key keys[] = {
	/* modifier                     key        function        argument */
    //{ 0,                            XF86XK_MonBrightnessUp,    spawn, {.v = brupcmd} },
    //{ 0,                            XF86XK_MonBrightnessDown,  spawn, {.v = brdowncmd} },
    { 0,                            XF86XK_AudioMute,          spawn, {.v = mutecmd } },
    { 0,                            XF86XK_AudioLowerVolume,   spawn, {.v = voldowncmd } },
    { 0,                            XF86XK_AudioRaiseVolume,   spawn, {.v = volupcmd } },
	{ MODKEY|ShiftMask,             XK_l, 	   spawn,          {.v = slockcmd } },
	{ MODKEY,                       XK_z, 	   spawn,          {.v = boomercmd } },
	{ MODKEY,                       XK_r,      spawn,          {.v = roficmd } },
	{ MODKEY,             		    XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	//{ MODKEY,                       XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY|ShiftMask,             XK_q,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_agrave, view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_agrave, tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_semicolon, focusmon,    {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_semicolon, tagmon,      {.i = +1 } },
	TAGKEYS(                        XK_ampersand,              0)
	TAGKEYS(                        XK_eacute,                 1)
	TAGKEYS(                        XK_quotedbl,               2)
	TAGKEYS(                        XK_apostrophe,             3)
	TAGKEYS(                        XK_parenleft,              4)
	TAGKEYS(                        XK_minus,                  5)
	//TAGKEYS(                        XK_egrave,                 6)
	//TAGKEYS(                        XK_underscore,             7)
	//TAGKEYS(                        XK_ccedilla,               8)
	{ MODKEY|ShiftMask,             XK_c,      quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

