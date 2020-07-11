package com.xu.ssm.po;

import java.util.ArrayList;
import java.util.List;

public class SongListExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public SongListExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andSonglistidIsNull() {
            addCriterion("songlistid is null");
            return (Criteria) this;
        }

        public Criteria andSonglistidIsNotNull() {
            addCriterion("songlistid is not null");
            return (Criteria) this;
        }

        public Criteria andSonglistidEqualTo(Integer value) {
            addCriterion("songlistid =", value, "songlistid");
            return (Criteria) this;
        }

        public Criteria andSonglistidNotEqualTo(Integer value) {
            addCriterion("songlistid <>", value, "songlistid");
            return (Criteria) this;
        }

        public Criteria andSonglistidGreaterThan(Integer value) {
            addCriterion("songlistid >", value, "songlistid");
            return (Criteria) this;
        }

        public Criteria andSonglistidGreaterThanOrEqualTo(Integer value) {
            addCriterion("songlistid >=", value, "songlistid");
            return (Criteria) this;
        }

        public Criteria andSonglistidLessThan(Integer value) {
            addCriterion("songlistid <", value, "songlistid");
            return (Criteria) this;
        }

        public Criteria andSonglistidLessThanOrEqualTo(Integer value) {
            addCriterion("songlistid <=", value, "songlistid");
            return (Criteria) this;
        }

        public Criteria andSonglistidIn(List<Integer> values) {
            addCriterion("songlistid in", values, "songlistid");
            return (Criteria) this;
        }

        public Criteria andSonglistidNotIn(List<Integer> values) {
            addCriterion("songlistid not in", values, "songlistid");
            return (Criteria) this;
        }

        public Criteria andSonglistidBetween(Integer value1, Integer value2) {
            addCriterion("songlistid between", value1, value2, "songlistid");
            return (Criteria) this;
        }

        public Criteria andSonglistidNotBetween(Integer value1, Integer value2) {
            addCriterion("songlistid not between", value1, value2, "songlistid");
            return (Criteria) this;
        }

        public Criteria andSongmenuidIsNull() {
            addCriterion("songmenuid is null");
            return (Criteria) this;
        }

        public Criteria andSongmenuidIsNotNull() {
            addCriterion("songmenuid is not null");
            return (Criteria) this;
        }

        public Criteria andSongmenuidEqualTo(Integer value) {
            addCriterion("songmenuid =", value, "songmenuid");
            return (Criteria) this;
        }

        public Criteria andSongmenuidNotEqualTo(Integer value) {
            addCriterion("songmenuid <>", value, "songmenuid");
            return (Criteria) this;
        }

        public Criteria andSongmenuidGreaterThan(Integer value) {
            addCriterion("songmenuid >", value, "songmenuid");
            return (Criteria) this;
        }

        public Criteria andSongmenuidGreaterThanOrEqualTo(Integer value) {
            addCriterion("songmenuid >=", value, "songmenuid");
            return (Criteria) this;
        }

        public Criteria andSongmenuidLessThan(Integer value) {
            addCriterion("songmenuid <", value, "songmenuid");
            return (Criteria) this;
        }

        public Criteria andSongmenuidLessThanOrEqualTo(Integer value) {
            addCriterion("songmenuid <=", value, "songmenuid");
            return (Criteria) this;
        }

        public Criteria andSongmenuidIn(List<Integer> values) {
            addCriterion("songmenuid in", values, "songmenuid");
            return (Criteria) this;
        }

        public Criteria andSongmenuidNotIn(List<Integer> values) {
            addCriterion("songmenuid not in", values, "songmenuid");
            return (Criteria) this;
        }

        public Criteria andSongmenuidBetween(Integer value1, Integer value2) {
            addCriterion("songmenuid between", value1, value2, "songmenuid");
            return (Criteria) this;
        }

        public Criteria andSongmenuidNotBetween(Integer value1, Integer value2) {
            addCriterion("songmenuid not between", value1, value2, "songmenuid");
            return (Criteria) this;
        }

        public Criteria andMusicidIsNull() {
            addCriterion("musicid is null");
            return (Criteria) this;
        }

        public Criteria andMusicidIsNotNull() {
            addCriterion("musicid is not null");
            return (Criteria) this;
        }

        public Criteria andMusicidEqualTo(Integer value) {
            addCriterion("musicid =", value, "musicid");
            return (Criteria) this;
        }

        public Criteria andMusicidNotEqualTo(Integer value) {
            addCriterion("musicid <>", value, "musicid");
            return (Criteria) this;
        }

        public Criteria andMusicidGreaterThan(Integer value) {
            addCriterion("musicid >", value, "musicid");
            return (Criteria) this;
        }

        public Criteria andMusicidGreaterThanOrEqualTo(Integer value) {
            addCriterion("musicid >=", value, "musicid");
            return (Criteria) this;
        }

        public Criteria andMusicidLessThan(Integer value) {
            addCriterion("musicid <", value, "musicid");
            return (Criteria) this;
        }

        public Criteria andMusicidLessThanOrEqualTo(Integer value) {
            addCriterion("musicid <=", value, "musicid");
            return (Criteria) this;
        }

        public Criteria andMusicidIn(List<Integer> values) {
            addCriterion("musicid in", values, "musicid");
            return (Criteria) this;
        }

        public Criteria andMusicidNotIn(List<Integer> values) {
            addCriterion("musicid not in", values, "musicid");
            return (Criteria) this;
        }

        public Criteria andMusicidBetween(Integer value1, Integer value2) {
            addCriterion("musicid between", value1, value2, "musicid");
            return (Criteria) this;
        }

        public Criteria andMusicidNotBetween(Integer value1, Integer value2) {
            addCriterion("musicid not between", value1, value2, "musicid");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}