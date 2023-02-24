public with sharing class AccountTriggerHandler {
    AccountTriggerHelper helper = new AccountTriggerHelper();

    public void run() {
        if (AccountTriggerHelper.hasRun) {
            return;
        }
        AccountTriggerHelper.hasRun = true;

        switch on Trigger.operationType {
            when BEFORE_INSERT {
                beforeInsert(Trigger.new);
            }
            when BEFORE_UPDATE {
                beforeUpdate(Trigger.old, Trigger.new, Trigger.oldMap, Trigger.newMap);
            }
            when BEFORE_DELETE {
                beforeDelete(Trigger.old, Trigger.oldMap);
            }
            when AFTER_INSERT {
                afterInsert(Trigger.new, Trigger.newMap);
            }
            when AFTER_UPDATE {
                afterUpdate(Trigger.old, Trigger.new, Trigger.oldMap, Trigger.newMap);
            }
            when AFTER_DELETE {
                afterDelete(Trigger.old, Trigger.oldMap);
            }
            when AFTER_UNDELETE {
                afterUndelete(Trigger.new, Trigger.newMap);
            }
        }
        AccountTriggerHelper.hasRun = false;
    }

    public void beforeInsert(List<Account> newAccounts) {
        helper.doTask1();
    }

    public void beforeUpdate(List<Account> oldAccounts, List<Account> newAccounts, Map<ID, SObject> oldAccountMap, Map<ID, SObject> newAccountMap) {
        helper.doTask2();
    }

    public void beforeDelete(List<Account> oldAccounts, Map<ID, SObject> oldAccountMap) {
        helper.doTask3();
    }

    public void afterInsert(List<Account> newAccounts, Map<ID, SObject> newAccountMap) {
        helper.doTask4();
    }

    public void afterUpdate(List<Account> oldAccounts, List<Account> newAccounts, Map<ID, SObject> oldAccountMap, Map<ID, SObject> newAccountMap) {
        helper.doTask5();
    }

    public void afterDelete(List<Account> oldAccounts, Map<ID, SObject> oldAccountMap) {
        helper.doTask6();
    }

    public void afterUndelete(List<Account> newAccounts, Map<ID, SObject> newAccountMap) {
        helper.doTask7();
    }
}
