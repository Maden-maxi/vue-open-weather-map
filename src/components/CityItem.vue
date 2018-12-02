<template>
    <div>
        <md-dialog-confirm
                :md-active.sync="active"
                md-title="Do you really want to delete this city?"
                md-content=""
                md-confirm-text="Yes"
                md-cancel-text="No"
                @md-cancel="onCancel"
                @md-confirm="onConfirm" />
        <md-card md-with-hover>

            <md-card-header>
                <div class="md-title">{{city.name}}, {{city.sys.country}}</div>
            </md-card-header>

            <md-card-actions>
                <md-button class="md-fab" v-if="isDeletable" @click="active = true">
                    <md-icon>delete</md-icon>
                </md-button>
                <router-link tag="md-button" :to="{ name: 'city', params: { id: city.id } }">View details</router-link>
            </md-card-actions>

        </md-card>
    </div>


</template>

<script>
export default {
  name: "CityItem",
  props: {
    city: Object,
    isDeletable: {
      type: Boolean,
      default: true
    }
  },
  data() {
    return {
      active: false
    };
  },
  methods: {
    onConfirm() {
      this.$emit("remove", this.city.id);
    },
    onCancel() {}
  }
};
</script>

<style scoped>
</style>
