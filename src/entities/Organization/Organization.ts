import { v4 } from 'uuid'

class Organization {
  id: string
  name: string

  constructor(props: Omit<Organization, 'id'>, id?: string) {
    Object.assign(this, props)

    if (!id) {
      this.id = v4()
    }
  }
}

export { Organization }
