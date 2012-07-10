/**
 * ADOBE SYSTEMS INCORPORATED
 * Copyright 2008-2011 Adobe Systems Incorporated
 * All Rights Reserved.
 *
 * NOTICE: Adobe permits you to use, modify, and distribute this file
 * in accordance with the terms of the license agreement accompanying it.
 * 
 * Author: Jozsef Vass
 */
 
 package
 {
 	import flash.events.Event;
 	import flash.events.EventDispatcher;
 	
 	public class AbstractIdManager extends EventDispatcher
 	{
 		/**
 		 * Dispatched when user id registartion succeeds.
 		 */
 		[Event(name="registerSuccess", type="IdManagerEvent2")]
 		
 		/**
 		 * Dispatched when user id registration failed.
 		 */
 		[Event(name="registerFailure", type="IdManagerError")]
 		
 		/**
 		 * Dispatched when user lookup failed.
 		 */
 		[Event(name="lookupFailure", type="IdManagerError")]
 		 		
 		 /**
 		  * Dispatched when user lookup suceeded. The evnt containns both
 		  * the user name and id.  This event also dispatched when the user is not,
 		  * registered, in this case, the id in the event is empty. 
 		  */
 		[Event(name="lookupSuccess", type="IdManagerEvent")]
 		
 		/**
 		 * Error during user lookup.
 		 */
 		[Event(name="idManagerError", type="IdManagerError")]
 		
 		/**
 		 * Register a user ID with 
 		 */
 		public function register(user:String, role:String, id:String):void
 		{
 			doRegister(user, role, id);
 		}
 		
 		/**
 		 * Lookup remote user id.
 		 */
 		public function lookup(user:String):void
 		{
 			doLookup(user);
 		}
 		
 		/**
 		 * Unregister from lookup service 
 		 */ 
 		 public function unregister():void
 		 {
 		 	doUnregister();
 		 }
		 
		 /**
		  * Unregister from lookup service 
		  */ 
		 public function inviteThirdPart(hosterId:String, attenderId:String):void
		 {
			 doInviteThirdPart(hosterId, attenderId);
		 }
 		 
 		 /**
 		  * Configure service information 
 		  */
 		 public function set service(service:Object):void
 		 {
 		 	doSetService(service);
 		 }
 		
 		 protected function doRegister(user:String, role:String, id:String):void
 		 {
 		 	// MUST override, failure by default
 			var e:Event = new Event("registerFailure");
 			dispatchEvent(e);
 		 }
 		 
 		 protected function doLookup(user:String):void
 		 {
 		 	// MUST override, failure by default
 			var e:Event = new Event("lookupFailure");
 			dispatchEvent(e);
 		 }
 		 
 		 protected function doUnregister():void
 		 {
 		 	// MUST override
 		 }
		 
		 protected function doInviteThirdPart(hosterId:String, attenderId:String):void
		 {
			 // MUST override
		 }
 		 
 		 protected function doSetService(service:Object):void
 		 {
 		 	// MUST override
 		 }
 	}
 }
