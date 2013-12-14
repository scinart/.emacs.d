	.586
	.model flat, stdcall
	option casemap :none
	include windows.inc
	include user32.inc
	include kernel32.inc
	include masm32.inc
	include msvcrt.inc

	includelib user32.lib
	includelib kernel32.lib
	includelib masm32.lib
	includelib msvcrt.lib
	
	.data
	LF BYTE 13, 10, 0
	Pause BYTE "pause"
		

	.code
	_start:



	invoke crt_system, ADDR Pause
	invoke ExitProcess, 0
	end _start
	
