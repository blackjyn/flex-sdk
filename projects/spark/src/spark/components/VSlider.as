////////////////////////////////////////////////////////////////////////////////
//
//  ADOBE SYSTEMS INCORPORATED
//  Copyright 2008 Adobe Systems Incorporated
//  All Rights Reserved.
//
//  NOTICE: Adobe permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

package spark.components
{

import flash.display.DisplayObject;
import flash.geom.Point;
import flash.geom.Rectangle;

import mx.core.IDataRenderer;

import spark.components.supportClasses.Slider;

//--------------------------------------
//  Other metadata
//--------------------------------------

[IconFile("VSlider.png")]
[DefaultTriggerEvent("change")]

/**
 *  The VSlider class defines a vertical slider component.
 *
 *  @includeExample examples/VSliderExample.mxml
 *  
 *  @langversion 3.0
 *  @playerversion Flash 10
 *  @playerversion AIR 1.5
 *  @productversion Flex 4
 */
public class VSlider extends Slider
{
    include "../core/Version.as";

    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------

    /**
     *  Constructor. 
     *  
     *  @langversion 3.0
     *  @playerversion Flash 10
     *  @playerversion AIR 1.5
     *  @productversion Flex 4
     */
    public function VSlider()
    {
        super();
    }
    
    //--------------------------------------------------------------------------
    //
    // Methods
    //
    //--------------------------------------------------------------------------

    /**
     *  @private
     *  Note that this method is slightly different than the HSlider version because
     *  the minimum occurs at the bottom of the VSlider, where y is largest.
     */
    override protected function pointToValue(x:Number, y:Number):Number
    {
        if (!thumb || !track)
            return 0;
            
        var thumbRange:Number = track.getLayoutBoundsHeight() - thumb.getLayoutBoundsHeight();
        var range:Number = maximum - minimum;
        return minimum + ((thumbRange != 0) ? ((thumbRange - y) / thumbRange) * range : 0); 
            }
            
    /**
     *  @private
     */
    override protected function updateSkinDisplayList():void
    {
        if (!thumb || !track)
            return;
    
        var thumbRange:Number = track.getLayoutBoundsHeight() - thumb.getLayoutBoundsHeight();
        var range:Number = maximum - minimum;
        var thumbPos:Number = (range > 0) ? thumbRange - (((pendingValue - minimum) / range) * thumbRange) : 0;
        thumb.setLayoutBoundsPosition(thumb.getLayoutBoundsX(), Math.round(track.getLayoutBoundsY() + thumbPos));
    }
    
    /**
     *  @private
     *  FIXME (jszeto): Update this to also use the ILayoutElement API 
     */
    override protected function updateDataTip(dataTipInstance:IDataRenderer, initialPosition:Point):void
    {
    	var tipAsDisplayObject:DisplayObject = dataTipInstance as DisplayObject;
    	
    	if (tipAsDisplayObject && thumb)
    	{
			var relY:Number = thumb.getLayoutBoundsY() + 
							(thumb.getLayoutBoundsHeight() - tipAsDisplayObject.height) / 2;
	        var o:Point = new Point(initialPosition.x, relY);
	        var r:Point = localToGlobal(o);        
			
			// Get the screen bounds
			var screenBounds:Rectangle = systemManager.getVisibleApplicationRect();
			// Get the tips bounds. We only care about the dimensions.
			var tipBounds:Rectangle = tipAsDisplayObject.getBounds(tipAsDisplayObject.parent);
			
			// Make sure the tip doesn't exceed the bounds of the screen
			r.x = Math.floor( Math.max(screenBounds.left, 
							  	Math.min(screenBounds.right - tipBounds.width, r.x)));
			r.y = Math.floor( Math.max(screenBounds.top, 
								Math.min(screenBounds.bottom - tipBounds.height, r.y)));
								
			r = tipAsDisplayObject.parent.globalToLocal(r);
        	tipAsDisplayObject.x = r.x;
        	tipAsDisplayObject.y = r.y;
    	}
    }
    
}

}
