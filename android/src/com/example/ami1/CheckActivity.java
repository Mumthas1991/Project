 package com.example.ami1;

import java.util.*;
import javax.mail.*;


public class CheckActivity {
 public static void main(String[] args){
	Properties props=new Properties();
	props.setProperty("mail.store.protocol","imaps");
	try{
	Session session=Session.getInstance(props,null);
	Store store=session.getStore();
	store.connect("imap.gmail.com","amitha.vp333@gmail.com","attiprakkill@333");
	Folder inbox=store.getFolder("INBOX");
	inbox.open(Folder.READ_ONLY);
	Message msg=inbox.getMessage(inbox.getMessageCount());
	Address[] in=msg.getFrom();
	for(Address address : in){
		System.out.println("FROM:"+address.toString());
	}
	Multipart mp=(Multipart)msg.getContent();
	BodyPart bp=mp.getBodyPart(0);
	System.out.println("SENT DATE:"+msg.getSentDate());
	System.out.println("SUBJECT:"+msg.getSubject());
	System.out.println("CONTENT:"+bp.getContent());
	}   
	catch(Exception mex){
		mex.printStackTrace();
	}
}
}