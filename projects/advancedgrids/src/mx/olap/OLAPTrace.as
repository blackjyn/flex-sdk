////////////////////////////////////////////////////////////////////////////////
//
//  ADOBE SYSTEMS INCORPORATED
//  Copyright 2009 Adobe Systems Incorporated
//  All Rights Reserved.
//
//  NOTICE: Adobe permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

package mx.olap
{

/**
 *  The OLAPTrace class controls the generation of trace information 
 *  generated by the OLAP classes and written to the log file. 
 *  This class uses the <code>trace()</code> method internally to write out the log information.
 *
 *  <p>You must set <code>TraceOutputFileEnable=1</code> in mm.cfg, and use the 
 *  Debug Flash Player or AIR Debug Launcher to generate trace output.</p> 
 *
 *  @see trace()
 *  
 *  @langversion 3.0
 *  @playerversion Flash 9
 *  @playerversion AIR 1.1
 *  @productversion Flex 3
 */
public class OLAPTrace
{
    include "../core/Version.as";
    
    //--------------------------------------------------------------------------
    //
    //  Class constants
    //
    //--------------------------------------------------------------------------
    
    /**
     *  Set to <code>true</code> to enable trace output.
     *
     *  @default true
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public static var traceOn:Boolean = true;
    
    /**
     *  The current trace level, which determines the amount of trace information
     *  written to the log file, <code>TRACE_LEVEL_1</code> writes the least amount of 
     *  information to the log file, and <code>TRACE_LEVEL_3</code> writes the most.
     *
     *  <p>All trace information output by a call to the <code>traceMsg()</code> method 
     *  with a <code>level</code> argument less than <code>traceLevel</code> 
     *  is sent to the log file.</p>
     *
     *  @default TRACE_LEVEL_1
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public static var traceLevel:int = 1;

    /**
     *  Specifies to write minimal trace information to the log file. 
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public static const TRACE_LEVEL_1:int = 1;

    /**
     *  Specifies to write more trace information to the log file than <code>TRACE_LEVEL_1</code>. 
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public static const TRACE_LEVEL_2:int = 2;

    /**
     *  Specifies to write the most trace information to the log file.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public static const TRACE_LEVEL_3:int = 3;
    
    //--------------------------------------------------------------------------
    //
    //  Class methods
    //
    //--------------------------------------------------------------------------
    
    /**
     *  Writes trace information to the log file
     *.
     *  <p>You must set <code>TraceOutputFileEnable=1</code> in mm.cfg, and use the 
     *  Debug Flash Player or AIR Debug Launcher to generate 
     *  trace output by calling this method.</p> 
     *
     *  @param msg The trace message.
     *
     *  @param level The trace level of the message.
     *  Only trace messages with a <code>level</code> argument less than <code>traceLevel</code> 
     *  are sent to the log file.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public static function traceMsg(msg:String, level:int=1):void
    {
        if (traceOn && level <= traceLevel)
            trace(msg);
    }
}

}