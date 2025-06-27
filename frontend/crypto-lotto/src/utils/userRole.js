// za ponovnu upotrebu
import { ref, onMounted } from "vue";
import { isAdmin } from "./contract";

export function useUserRole() {
  const isAdminUser = ref(false);

  onMounted(async () => {
    isAdminUser.value = await isAdmin();
  });

  return { isAdminUser };
}
