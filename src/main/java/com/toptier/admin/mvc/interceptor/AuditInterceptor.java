package com.toptier.admin.mvc.interceptor;

import java.io.Serializable;

import org.hibernate.EmptyInterceptor;
import org.hibernate.type.Type;
import org.joda.time.LocalDate;

public class AuditInterceptor extends EmptyInterceptor {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public boolean onFlushDirty(Object entity, Serializable id,
	        Object[] currentState, Object[] previousState,
	        String[] propertyNames, Type[] types) {
	    return audit(currentState, propertyNames);              
	}

	@Override
	public boolean onSave(Object entity, Serializable id, Object[] state,
	        String[] propertyNames, Type[] types) {
	    return audit(state, propertyNames);
	}

	private boolean audit(Object[] currentState, String[] propertyNames) {
	    boolean changed = false;
	    for(int i=0;i<propertyNames.length;i++){
	        if("modifiedBy".equals(propertyNames[i])){
	            Object currentDate = currentState[i];
	            if(currentDate == null){
	                currentState[i] = "aaaa";
	                changed = true;
	            }
	        }

	        if("modifiedDate".equals(propertyNames[i])){
	            currentState[i] = new LocalDate();
	            changed = true;
	        }
	    }
	    return changed;
	}
}
